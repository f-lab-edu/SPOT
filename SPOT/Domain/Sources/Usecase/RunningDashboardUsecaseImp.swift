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
    private var cancellables = Set<AnyCancellable>()
    
    private let locationController: LocationController
    private let activityController: ActivityController
    
    public init(locationController: LocationController, activityController: ActivityController) {
        self.locationController = locationController
        self.activityController = activityController
        
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
    }
}
