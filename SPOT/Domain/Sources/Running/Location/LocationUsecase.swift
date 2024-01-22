//
//  LocationUsecase.swift
//
//
//  Created by 10004 on 1/22/24.
//

import Foundation
import Dependencies
import RunningDataAccess

public protocol LocationUsecaseProtocol {
    func start()
    func pause()
    func stop()
}

public final class LocationUsecase: LocationUsecaseProtocol {
    
    @Dependency(\.locationClient) var client
    
    public init() {}
    
    public func start() {}
    
    public func pause() {}
    
    public func stop() {}
}
