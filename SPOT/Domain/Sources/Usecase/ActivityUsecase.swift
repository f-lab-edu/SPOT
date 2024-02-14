//
//  ActivityUsecase.swift
//  
//
//  Created by 김민식 on 2024/02/13.
//

import Combine

import Entity

public protocol ActivityUsecase {
    var activity: AnyPublisher<Activity, Never> { get }
}
