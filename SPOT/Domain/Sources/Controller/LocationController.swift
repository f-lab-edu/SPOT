//
//  LocationController.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation
import Entity

protocol LocationController {
    func authorizationStatus(completion: @Sendable () async -> Bool)
    func location(completion: @Sendable () async -> Location)
    func requestLocation(completion: @Sendable () async -> Void)
    func requestWhenInUseAuthorization(completion: @Sendable () async -> Void)
    func startUpdatingLocation(completion: @Sendable () async -> Void)
}
