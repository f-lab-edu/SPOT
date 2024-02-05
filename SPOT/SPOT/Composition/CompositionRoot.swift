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

class CompositionRoot {
    var locationView: some View {
        LocationView(store: locationCore)
    }
    
    var locationCore: StoreOf<LocationCore> {
        Store(initialState: LocationCore.State(usecase: runningLocationManager)) {
            
        }
    }
    
    init() {
        self.locationManager = CLLocationManager()
        self.runningLocationManager = RunningLocationService(manager: locationManager)
    }
    
    var runningLocationManager: LocationUsecase
    
    let locationManager: CLLocationManager
}
