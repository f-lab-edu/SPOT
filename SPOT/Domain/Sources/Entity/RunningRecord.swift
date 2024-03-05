//
//  RunningRecord.swift
//
//
//  Created by 김민식 on 2024/02/28.
//

import Foundation

public final class RunningRecord: Encodable, Decodable {
    public private(set) var locations: [Location]
    public private(set) var activity: Activity
    public private(set) var time: Int
    
    public init(locations: [Location] = [], activity: Activity = .init(distance: 0, pace: 0, calories: 0), time: Int = 0) {
        self.locations = locations
        self.activity = activity
        self.time = time
    }
    
    public func update(location: Location, activity: Activity, time: Int) {
        self.locations.append(location)
        self.activity = activity
        self.time += time
    }
}
