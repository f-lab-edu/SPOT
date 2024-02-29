//
//  RunningDashboardUsecaseImp.swift
//
//
//  Created by 10004 on 2/18/24.
//

import Foundation
import Combine

import Controller
import Entity

public final class RunningDashboardUsecaseImp: RunningDashboardUsecase {
    public var location = PassthroughSubject<Location, Never>()
    public var activity = PassthroughSubject<Activity, Never>()
    public var runningTime = PassthroughSubject<Int, Never>()
    private let recordTimer: Publishers.Autoconnect<Timer.TimerPublisher>
    private var record: RunningRecord
    private var cancellables = Set<AnyCancellable>()
    
    private let locationController: LocationController
    private let activityController: ActivityController
    private let persistanceController: PersistanceController
    private let timerUsecase: TimerUsecase
    
    private static let RecordSaveKey = "RecordSaveKey"
    
    public init(locationController: LocationController, activityController: ActivityController, persistanceController: PersistanceController, record: RunningRecord, timerUsecase: TimerUsecase, recordTimer: Publishers.Autoconnect<Timer.TimerPublisher>) {
        self.locationController = locationController
        self.activityController = activityController
        self.persistanceController = persistanceController
        self.record = record
        self.timerUsecase = timerUsecase
        self.recordTimer = recordTimer
        
        self.locationController.location
            .sink { newLocation in
                self.location.send(newLocation)
            }
            .store(in: &cancellables)
        
        self.activityController.activity
            .sink { newActivity in
                self.activity.send(newActivity)
            }
            .store(in: &cancellables)
        
        self.timerUsecase.runningTime
            .sink { newRunningTime in
                self.runningTime.send(newRunningTime)
            }
            .store(in: &cancellables)
        
        self.saveRecord()
    }
    
    public func saveRecord() {
        let stream = Publishers.CombineLatest3(locationController.location, activityController.activity, timerUsecase.runningTime)
            .map { location, activity, time in
                self.record.update(location: location, activity: activity, time: time)
            }
        
        stream
            .zip(recordTimer)
            .sink { record, _ in
                self.persistanceController.save(model: self.record, with: RunningDashboardUsecaseImp.RecordSaveKey)
            }
            .store(in: &cancellables)
    }
    
    public func loadRecord() -> RunningRecord {
        let record: RunningRecord? = self.persistanceController.load(key: RunningDashboardUsecaseImp.RecordSaveKey) as? RunningRecord
    }
}
