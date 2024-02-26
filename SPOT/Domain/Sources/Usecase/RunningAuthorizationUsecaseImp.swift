//
//  RunningAuthorizationUsecaseImp.swift
//  
//
//  Created by 10004 on 2/18/24.
//

import Foundation
import Combine

import Controller
import Entity

public final class RunningAuthorizationUsecaseImp: RunningAuthorizationUsecase {
    public var locationAuthorizationStatus = PassthroughSubject<AuthorizationStatus, Never>()
    public var activityAuthorizationStatus = PassthroughSubject<ActivityAuthorizationStatus, Never>()
    
    private let locationController: LocationController
    private let activityController: ActivityController
    private var cancellables = Set<AnyCancellable>()
    
    public init(locationController: LocationController, activityController: ActivityController) {
        self.locationController = locationController
        self.activityController = activityController
    }
    
    public func requestAuthorization() async {
        await locationController.requestLocation()
        await activityController.requestActivity()
        
        locationController.authorizationStatus
            .sink { status in
                self.locationAuthorizationStatus.send(status)
            }
            .store(in: &cancellables)
        
        activityController.authorizationStatus
            .sink { status in
                self.activityAuthorizationStatus.send(status)
            }
            .store(in: &cancellables)
    }
}

