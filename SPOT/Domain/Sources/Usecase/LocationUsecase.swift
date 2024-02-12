//
//  LocationUsecase.swift
//
//
//  Created by 10004 on 1/22/24.
//

import Combine

import Entity

public protocol LocationUsecase {
    var location: AnyPublisher<Location, Never> { get }
    
    func startRunning()
}
