//
//  CompositionRoot.swift
//  SPOT
//
//  Created by 김민식 on 2024/02/02.
//

import CoreLocation
import SwiftUI

import ComposableArchitecture
import TCAProxy
import LocationFeature
import Running
import RunningDataAccess

enum CompositionRoot {
    static var locationView: some View {
        LocationView(store: locationCore)
    }
    
    static var locationCore: StoreOf<LocationCore> {
        Store(initialState: LocationCore.State(usecase: runningLocationManager)) {
            
        }
    }
    
    private static var runningLocationManager: LocationUsecaseProtocol = RunningLocationManager(manager: locationManager)
    
    private static let locationManager = CLLocationManager()
    
}
