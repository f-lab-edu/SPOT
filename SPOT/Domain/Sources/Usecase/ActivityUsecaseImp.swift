//
//  ActivityUsecaseImp.swift
//
//
//  Created by 김민식 on 2024/02/13.
//

import Foundation
import Combine

import Controller
import Entity

public final class ActivityUsecaseImp: ActivityUsecase {
    public let activity: AnyPublisher<Activity, Never> = PassthroughSubject.init().eraseToAnyPublisher()
    
//    private let locationController: LocationController
    
//    public init(locationController: LocationController) {
//        self.locationController = locationController
//    }
    
    public func startRunning() {
//        locationController.start()
    }
    
    public func pauseRunning() {
        
    }
    
    public func resumeRunning() {
        
    }
    
    public func stopRunning() {
        
    }
}

