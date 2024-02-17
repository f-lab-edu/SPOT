//
//  LocationService.swift
//
//
//  Created by 10004 on 1/21/24.
//

import CoreLocation
import Combine

import Controller
import Entity

public final class LocationService: LocationController {
    public var location = PassthroughSubject<Location, Never>()
    public var authorizationStatus = PassthroughSubject<AuthorizationStatus, Never>()
    public var updatingLocation = PassthroughSubject<Bool, Never>()
    public var locationError = PassthroughSubject<Error, Never>()
    private let manager: CLLocationManager
    private var delegate: LocationServiceDelegate
    
    public init(manager: CLLocationManager) {
        self.manager = manager
        self.delegate = LocationServiceDelegate(location: location,
                                                authorizationStatus: authorizationStatus,
                                                updatingLocation: updatingLocation,
                                                locationError: locationError)
        self.manager.delegate = self.delegate
    }
    
    public func start() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
        manager.startUpdatingLocation()
    }
    
    public func pause() {
        manager.stopUpdatingLocation()
    }
    
    public func resume() {
        manager.startUpdatingLocation()
    }
    
    public func stop() {
        manager.stopUpdatingLocation()
        manager.delegate = nil
    }
}

private final class LocationServiceDelegate: NSObject, CLLocationManagerDelegate {
    let location: PassthroughSubject<Location, Never>
    let authorizationStatus: PassthroughSubject<AuthorizationStatus, Never>
    let updatingLocation: PassthroughSubject<Bool, Never>
    let locationError: PassthroughSubject<Error, Never>
    
    init(location: PassthroughSubject<Location, Never>,
         authorizationStatus: PassthroughSubject<AuthorizationStatus, Never>,
         updatingLocation: PassthroughSubject<Bool, Never>,
         locationError: PassthroughSubject<Error, Never>) {
        self.location = location
        self.authorizationStatus = authorizationStatus
        self.updatingLocation = updatingLocation
        self.locationError = locationError
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.forEach { location in
            self.location.send(Location(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            authorizationStatus.send(.always)
        case .authorizedWhenInUse:
            authorizationStatus.send(.whenInUse)
        case .restricted:
            authorizationStatus.send(.restricted)
        case .notDetermined:
            authorizationStatus.send(.notDetermined)
        case .denied:
            authorizationStatus.send(.denied)
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationError.send(error)
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        updatingLocation.send(false)
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        updatingLocation.send(true)
    }
}
