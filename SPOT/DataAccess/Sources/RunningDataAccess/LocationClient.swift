//
//  LocationManager.swift
//
//
//  Created by 10004 on 1/21/24.
//

import CoreLocation
import Running

//protocol LocationClient {
//    func delegate(completion: @Sendable () async -> AsyncStream<RunningLocationManager.Action>)
//    func authorizationStatus(completion: @Sendable () async -> CLAuthorizationStatus)
//    func location(completion: @Sendable () async -> Location)
//    func requestLocation(completion: @Sendable () async -> Void)
//    func requestWhenInUseAuthorization(completion: @Sendable () async -> Void)
//    func startUpdatingLocation(completion: @Sendable () async -> Void)
//}

@MainActor
public final class MainActorIsolated<Value>: Sendable {
    public lazy var value: Value = initialValue()
    private let initialValue: @MainActor () -> Value
    nonisolated public init(initialValue: @MainActor @escaping () -> Value) {
        self.initialValue = initialValue
    }
}

public struct LcationAuthorizationStatus: Equatable {
    let status: CLAuthorizationStatus
}

public final class RunningLocationManager: LocationUsecaseProtocol {
    private let manager: CLLocationManager
    
    public init(manager: CLLocationManager) {
        self.manager = manager
        
        AsyncStream { continuation in
            let delegate = RunningLocationManagerDelegate(continuation: continuation)
            manager.delegate = delegate
            
            continuation.onTermination = { [delegate] _ in
                _ = delegate
            }
        }
        
        manager.requestWhenInUseAuthorization()
    }
    
    public func start() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
    
    public func pause() {
        
    }
    
    public func stop() {
        
    }
    
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
}

private final class RunningLocationManagerDelegate: NSObject, CLLocationManagerDelegate {
    let continuation: AsyncStream<RunningLocationManager.Action>.Continuation
    
    public init(
        continuation: AsyncStream<RunningLocationManager.Action>.Continuation
    ) {
        self.continuation = continuation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        continuation.yield(
            .didUpdateLocations(
                locations.map {
                    Location(coordinate: .init(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude))
                }
            )
        )
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        continuation.yield(.didChangeAuthorization(manager.authorizationStatus))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        continuation.yield(.didFailWithError(RunningLocationManager.Error(error)))
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        continuation.yield(.didPauseLocationUpdates)
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        continuation.yield(.didResumeLocationUpdates)
    }
}
