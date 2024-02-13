//
//  Activity.swift
//
//
//  Created by 김민식 on 2024/02/13.
//

import Foundation

public struct Activity {
    public let distance: Double
    public let calories: Double
    public let pace: Double
    
    public init(distance: Double, calories: Double, pace: Double) {
        self.distance = distance
        self.calories = calories
        self.pace = pace
    }
}
