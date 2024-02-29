//
//  RunningRecord.swift
//
//
//  Created by 김민식 on 2024/02/28.
//

import Foundation

public struct RunningRecord {
    public private(set) var locations: [Location]
    public private(set) var activity: Activity
    
    public init(locations: [Location] = [], activity: Activity = .init(distance: 0, pace: 0, calories: 0)) {
        self.locations = locations
        self.activity = activity
    }
    
    public mutating func update(locations: [Location], activity: Activity) {
        self.locations = locations
        self.activity = activity
    }
}
