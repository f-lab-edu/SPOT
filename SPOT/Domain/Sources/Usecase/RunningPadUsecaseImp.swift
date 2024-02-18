//
//  RunningPadUsecaseImp.swift
//
//
//  Created by 10004 on 2/18/24.
//

import Foundation
import Combine

import Controller
import Entity

public final class RunningPadUsecaseImp: RunningPadUsecase {
    private let locationController: LocationController
    private let activityController: ActivityController
    
    public init(locationController: LocationController, activityController: ActivityController) {
        self.locationController = locationController
        self.activityController = activityController
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
}
