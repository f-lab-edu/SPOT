//
//  RunningStreamUsecaseImp.swift
//
//
//  Created by 10004 on 2/18/24.
//

import Foundation
import Combine

import Controller
import Entity

public final class RunningDashboardUsecaseImp: RunningStreamUsecase, RunningControlUsecase {
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
            .sink {
                self.location.send($0)
            }
            .store(in: &cancellables)
        
        self.activityController.activity
            .sink {
                self.activity.send($0)
            }
            .store(in: &cancellables)
        
        self.timerUsecase.runningTime
            .sink {
                self.runningTime.send($0)
            }
            .store(in: &cancellables)
        
        self.saveRecord()
    }
    
    public func start(startedAt: Date) {
        locationController.start()
        activityController.startUpdates(startedAt: startedAt)
    }
    
    public func pause() {
        locationController.pause()
        activityController.stopUpdates()
    }
    
    public func resume(startedAt: Date) {
        locationController.resume()
        activityController.startUpdates(startedAt: startedAt)
    }
    
    public func stop() {
        locationController.stop()
        activityController.stopUpdates()
    }
    
    public func saveRecord() {
        let stream = Publishers.CombineLatest3(location, activity, runningTime)
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
    
    public func loadRecord() -> RunningRecord? {
        let record: RunningRecord? = self.persistanceController.load(key: RunningDashboardUsecaseImp.RecordSaveKey, type: RunningRecord.self)
        
        return record
    }
}
