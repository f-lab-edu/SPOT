//
//  Activity.swift
//
//
//  Created by 김민식 on 2024/02/13.
//

import Foundation

public struct Activity: Codable {
    public let distance: Double
    public let pace: Double
    public let calories: Double
    
    public init(distance: Double, pace: Double, calories: Double) {
        self.distance = distance
        self.pace = pace
        self.calories = calories
    }
}
