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
    private let locationController: LocationController
    private let activityController: ActivityController
    
    public init(locationController: LocationController, activityController: ActivityController) {
        self.locationController = locationController
        self.activityController = activityController
    }
    
    public func locationIsAuthorize() -> Bool {
        return true
    }
    
    public func activityIsAuthorize() -> Bool {
        return true
    }
}

