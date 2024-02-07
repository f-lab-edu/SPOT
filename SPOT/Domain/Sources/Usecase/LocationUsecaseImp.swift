//
//  LocationUsecaseImp.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation
import Combine

import Controller

public final class LocationUsecaseImp: LocationUsecase {
    public let location: AnyPublisher<Location, Never> = PassthroughSubject.init().eraseToAnyPublisher()
    
    private let locationController: LocationController
    
    public init(locationController: LocationController) {
        self.locationController = locationController
    }
    
    public func startRunning() {
        locationController.start()
    }
}
