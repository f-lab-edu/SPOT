//
//  LocationController.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Combine
import Foundation

import Entity

public protocol LocationController {
    var location: PassthroughSubject<Location, Never> { get }
    var authorizationStatus: PassthroughSubject<AuthorizationStatus, Never> { get }
    var updatingLocation: PassthroughSubject<Bool, Never> { get }
    var locationError: PassthroughSubject<Error, Never> { get }
    
    func start()
    func pause()
    func resume()
    func stop()
}
