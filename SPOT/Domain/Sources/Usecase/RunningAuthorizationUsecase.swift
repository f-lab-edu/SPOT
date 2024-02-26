//
//  RunningAuthorizationUsecase.swift
//
//
//  Created by 10004 on 2/18/24.
//

import Combine

import Entity

public protocol RunningAuthorizationUsecase {
    func requestAuthorization() async
    var locationAuthorizationStatus: PassthroughSubject<AuthorizationStatus, Never> { get }
    var activityAuthorizationStatus: PassthroughSubject<ActivityAuthorizationStatus, Never> { get }
}
