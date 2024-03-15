//
//  RunningDashboardUsecaseSpy.swift
//
//
//  Created by 10004 on 3/13/24.
//

import Combine
import Foundation

import Controller
import Entity
import Usecase

class RunningDashboardUsecaseSpy: RunningStreamUsecase {
    var locationMessages: [Location] = []
    var activityMessages: [Activity] = []
    var timeMessages: [Int] = []
    
    private let recordTimer: Publishers.Autoconnect<Timer.TimerPublisher>
    private var record: RunningRecord
    private var cancellables = Set<AnyCancellable>()
    
    private let locationController: LocationController
    private let activityController: ActivityController
    private let persistanceController: PersistanceController
    private let timerUsecase: TimerUsecase
    
    var location = PassthroughSubject<Location, Never>.init()
    var activity = PassthroughSubject<Activity, Never>.init()
    var runningTime = PassthroughSubject<Int, Never>.init()
    
    public init(locationController: LocationController, activityController: ActivityController, persistanceController: PersistanceController, record: RunningRecord, timerUsecase: TimerUsecase, recordTimer: Publishers.Autoconnect<Timer.TimerPublisher>) {
        self.locationController = locationController
        self.activityController = activityController
        self.persistanceController = persistanceController
        self.record = record
        self.timerUsecase = timerUsecase
        self.recordTimer = recordTimer
        
        self.locationController.location
            .sink {
                self.locationMessages.append($0)
            }
            .store(in: &cancellables)
        
        self.activityController.activity
            .sink {
                self.activityMessages.append($0)
            }
            .store(in: &cancellables)
        
        self.timerUsecase.runningTime
            .sink {
                self.timeMessages.append($0)
            }
            .store(in: &cancellables)
    }
}

