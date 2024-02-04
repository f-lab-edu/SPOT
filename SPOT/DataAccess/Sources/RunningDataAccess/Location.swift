//
//  Location.swift
//
//
//  Created by 10004 on 1/22/24.
//

import CoreLocation

public struct Location {
    public let coordinate: CLLocationCoordinate2D
    
    public init(coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)) {
        self.coordinate = coordinate
    }
}
