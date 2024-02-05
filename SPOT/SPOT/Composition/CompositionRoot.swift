//
//  CompositionRoot.swift
//  SPOT
//
//  Created by 김민식 on 2024/02/02.
//

import CoreLocation
import SwiftUI

import LocationFeature
import RunningFeature
import RunningDataAccess
import Usecase

class CompositionRoot {
    var RunningView: some View {
        RunningStatusView(viewModel: runningStatusViewModel)
    }
    
    var runningStatusViewModel = RunningStatusViewModel()
    
    var runningLocationManager: LocationUsecase
    let locationManager: CLLocationManager
    
    init() {
        self.locationManager = CLLocationManager()
        self.runningLocationManager = RunningLocationService(manager: locationManager)
    }
}
