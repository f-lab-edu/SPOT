//
//  LocationManager.swift
//
//
//  Created by 10004 on 1/21/24.
//

import CoreLocation
import Dependencies
import DependenciesWrapper

public struct LcationAuthorizationStatus: Equatable {
    let status: CLAuthorizationStatus
}

public struct LocationClient {
    public enum Action {
        case didChangeAuthorization(CLAuthorizationStatus)
        case didUpdateLocations([Location])
        case didPauseLocationUpdates
        case didResumeLocationUpdates
        case didFailWithError(Error)
    }
    
    public struct Error: Swift.Error, Equatable {
        public let error: NSError
        
        public init(_ error: Swift.Error) {
            self.error = error as NSError
        }
    }
    
    public var delegate: @Sendable () async -> AsyncStream<LocationClient.Action>
    public var authorizationStatus: @Sendable () async -> CLAuthorizationStatus
    public var location: @Sendable () async -> Location?
    public var requestLocation: @Sendable () async -> Void
    public var requestWhenInUseAuthorization: @Sendable () async -> Void
    public var startUpdatingLocation: @Sendable () async -> Void
}

extension LocationClient {
    public static let test = Self(
        delegate: unimplemented("\(Self.self).delegate"),
        authorizationStatus: unimplemented("\(Self.self).authorizationStatus"),
        location: unimplemented("\(Self.self).location"),
        requestLocation: unimplemented("\(Self.self).requestLocation"),
        requestWhenInUseAuthorization: unimplemented("\(Self.self).requestWhenInUseAuthorization"),
        startUpdatingLocation: unimplemented("\(Self.self).startUpdatingLocation")
    )
}

extension DependencyValues {
    public var locationClient: LocationClient {
        get { self[LocationClient.self] }
        set { self[LocationClient.self] = newValue }
    }
}

extension LocationClient: DependencyKey {
    public static var liveValue: Self { .live }
    public static var testValue: Self { .test }
}
