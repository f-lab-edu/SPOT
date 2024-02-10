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
    public var authorizationStatus = PassthroughSubject<Bool, Never>()
    public var updatingLocation = PassthroughSubject<Bool, Never>()
    private let manager: CLLocationManager
    private var delegate: LocationServiceDelegate
    
    public init(manager: CLLocationManager) {
        self.manager = manager
        self.delegate = LocationServiceDelegate(location: location,
                                               authorizationStatus: authorizationStatus,
                                               updatingLocation: updatingLocation)
        self.manager.delegate = self.delegate
    }
    
    public func start() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
    
    public func pause() {}
    
    public func resume() {}
    
    public func stop() {}
}

private final class LocationServiceDelegate: NSObject, CLLocationManagerDelegate {
    let location: PassthroughSubject<Location, Never>
    let authorizationStatus: PassthroughSubject<Bool, Never>
    let updatingLocation: PassthroughSubject<Bool, Never>
    
    init(location: PassthroughSubject<Location, Never>,
         authorizationStatus: PassthroughSubject<Bool, Never>,
         updatingLocation: PassthroughSubject<Bool, Never>) {
        self.location = location
        self.authorizationStatus = authorizationStatus
        self.updatingLocation = updatingLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.forEach { location in
            self.location.send(Location(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {}
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {}
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        updatingLocation.send(false)
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        updatingLocation.send(true)
    }
}
