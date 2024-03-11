//
//  LocationServiceSpy.swift
//  
//
//  Created by 10004 on 3/5/24.
//

import Combine

import Controller
import Entity
import RunningDataAccess
import Usecase

final class LocationServiceSpy: LocationController {
    typealias LocationMessage = PassthroughSubject<Location, Never>
    typealias AuthorizationStatusMessage = PassthroughSubject<AuthorizationStatus, Never>
    typealias UpdatingLocationMessage = PassthroughSubject<Bool, Never>
    typealias LocationErrorMessage = PassthroughSubject<Error, Never>
    
    private var cancellables: Set<AnyCancellable> = .init()
    var locationMessages: [LocationMessage] = []
    var authorizationStatusMessages: [AuthorizationStatusMessage] = []
    var updatingLocationMessages: [UpdatingLocationMessage] = []
    var locationErrorMessages: [LocationErrorMessage] = []
    var startCallCount: Int = 0
    var pauseCallCount: Int = 0
    var resumeCallCount: Int = 0
    var stopCallCount: Int = 0
    
    var location: PassthroughSubject<Location, Never> = .init() {
        didSet {
            locationMessages.append(location)
        }
    }
    
    var authorizationStatus: PassthroughSubject<AuthorizationStatus, Never> = .init() {
        didSet {
            authorizationStatusMessages.append(authorizationStatus)
        }
    }
    
    var updatingLocation: PassthroughSubject<Bool, Never> = .init() {
        didSet {
            updatingLocationMessages.append(updatingLocation)
        }
    }
    
    var locationError: PassthroughSubject<Error, Never> = .init() {
        didSet {
            locationErrorMessages.append(locationError)
        }
    }
    
    func requestLocation() async {}
    
    func isAuthoized() -> Bool {
        return true
    }
    
    func start() {
        startCallCount += 1
    }
    
    func pause() {
        pauseCallCount += 1
    }
    
    func resume() {
        resumeCallCount += 1
    }
    
    func stop() {
        stopCallCount += 1
    }
}

