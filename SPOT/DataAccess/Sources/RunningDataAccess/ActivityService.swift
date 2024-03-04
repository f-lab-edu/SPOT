//
//  ActivityService.swift
//
//
//  Created by 김민식 on 2024/02/13.
//

import CoreMotion
import Combine

import Controller
import Entity

public final class ActivityService: ActivityController {
    public var authorizationStatus = PassthroughSubject<Bool, Never>()
    public var activity = PassthroughSubject<Entity.Activity, Never>()
    private let pedometer: CMPedometer
    
    public init(pedometer: CMPedometer) {
        self.pedometer = pedometer
    }
    
    public func requestActivity() {
        guard !isAuthoized() else { return }
        
        pedometer.startUpdates(from: .now) { _, _ in
            self.authorizationStatus.send(true)
        }
    }
    
    public func isAuthoized() -> Bool {
        return CMPedometer.authorizationStatus() == .authorized
    }
    
    public func startUpdates(startedAt: Date) {
        pedometer.startUpdates(from: startedAt) { data, error in
            guard let data else { return }
            
            let distance = data.distance?.doubleValue ?? 0
            
            let updated = Activity(
                distance: distance,
                pace: data.currentPace?.doubleValue ?? 0,
                calories: distance * 70 * 0.005
            ) // FIXME: - 칼로리 계산식
            
            self.activity.send(updated)
        }
    }
    
    public func stopUpdates() {
        pedometer.stopUpdates()
    }
}
