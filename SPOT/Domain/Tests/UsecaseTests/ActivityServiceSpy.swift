//
//  ActivityServiceSpy.swift
//
//
//  Created by 10004 on 3/5/24.
//

import Combine
import Foundation

import Entity
import RunningDataAccess
import Usecase
import Controller


struct ActivityServiceSpy: ActivityController {
    typealias ActivityMessage = PassthroughSubject<Activity, Never>
    typealias AuthorizationStatusMessage = PassthroughSubject<Bool, Never>
    
    var activityMessages: [ActivityMessage] = []
    var authorizationStatusMessages: [AuthorizationStatusMessage] = []
    
    var activity: PassthroughSubject<Activity, Never> = .init() {
        didSet {
            activityMessages.append(activity)
        }
    }
    var authorizationStatus: PassthroughSubject<Bool, Never> = .init() {
        didSet {
            authorizationStatusMessages.append(authorizationStatus)
        }
    }
    
    func requestActivity() async {
      
    }
    
    func isAuthoized() -> Bool {
        return true
    }
    
    func startUpdates(startedAt: Date) {
      
    }
    
    func stopUpdates() {
      
    }
}
