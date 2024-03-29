//
//  ActivityController.swift
//  
//
//  Created by 김민식 on 2024/02/13.
//

import Combine
import Foundation

import Entity

public protocol ActivityController {
    var activity: PassthroughSubject<Activity, Never> { get }
    var authorizationStatus: PassthroughSubject<Bool, Never> { get }
    
    func requestActivity() async
    func isAuthoized() -> Bool
    func startUpdates(startedAt: Date)
    func stopUpdates()
}
