//
//  Location.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation

public struct Location: Codable {
    public let latitude: Double
    public let longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
