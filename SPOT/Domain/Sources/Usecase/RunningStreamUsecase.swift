//
//  RunningStreamUsecase.swift
//
//
//  Created by 10004 on 2/18/24.
//

import Combine

import Entity

public protocol RunningStreamUsecase {
    var location: PassthroughSubject<Location, Never> { get }
    var activity: PassthroughSubject<Activity, Never> { get }
    var runningTime: PassthroughSubject<Int, Never> { get }
}
