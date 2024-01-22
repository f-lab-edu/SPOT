//
//  LocationClientLive.swift
//  
//
//  Created by 10004 on 1/22/24.
//

import CoreLocation

extension LocationClient {
    public static var live: Self {
        let manager = MainActorIsolated(initialValue: { CLLocationManager() })
        
        return Self(
            delegate: {
                let manager = await manager.value
                
                return AsyncStream { continuation in
                    let delegate = LocationClientDelegate(continuation: continuation)
                    manager.delegate = delegate
                    
                    continuation.onTermination = { [delegate] _ in
                        _ = delegate
                    }
                }
            },
            authorizationStatus: {
                return await manager.value.authorizationStatus
            },
            location: {
                return await manager.value.location.map(Location.init(rawValue:))
            },
            requestLocation: {
                await manager.value.requestLocation()
            },
            requestWhenInUseAuthorization: {
                await manager.value.requestAlwaysAuthorization()
            },
            startUpdatingLocation: {
                await manager.value.startUpdatingLocation()
            }
        )
    }
}

private final class LocationClientDelegate: NSObject, CLLocationManagerDelegate {
    let continuation: AsyncStream<LocationClient.Action>.Continuation
    
    public init(
        continuation: AsyncStream<LocationClient.Action>.Continuation
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
        continuation.yield(.didFailWithError(LocationClient.Error(error)))
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        continuation.yield(.didPauseLocationUpdates)
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        continuation.yield(.didResumeLocationUpdates)
    }
}

@MainActor
public final class MainActorIsolated<Value>: Sendable {
    public lazy var value: Value = initialValue()
    private let initialValue: @MainActor () -> Value
    nonisolated public init(initialValue: @MainActor @escaping () -> Value) {
        self.initialValue = initialValue
    }
}

