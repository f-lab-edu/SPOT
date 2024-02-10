//
//  LocationUsecase.swift
//
//
//  Created by 10004 on 1/22/24.
//
import Combine

public protocol LocationUsecase {
    var location: AnyPublisher<Location, Never> { get }    
    func startRunning()
}

public struct Location {
    public let latitude: Double
    public let longitude: Double
}
