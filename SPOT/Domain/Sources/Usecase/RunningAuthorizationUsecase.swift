//
//  RunningAuthorizationUsecase.swift
//
//
//  Created by 10004 on 2/18/24.
//

import Combine

import Entity

public protocol RunningAuthorizationUsecase {
    var locationAuthorizationStatus: PassthroughSubject<AuthorizationStatus, Never> { get }
    var activityAuthorizationStatus: PassthroughSubject<Bool, Never> { get }
    
    func requestAuthorization() async
    func isAuthorizedLocation() -> Bool
    func isAuthorizedActivity() -> Bool
}
