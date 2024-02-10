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
import Controller
import Usecase

class CompositionRoot {
    var RunningView: some View {
        RunningStatusView(viewModel: runningStatusViewModel)
    }
    
    var runningStatusViewModel: RunningStatusViewModel
    var runningLocationUsecase: LocationUsecaseImp
    var locationController: LocationController
    let locationManager: CLLocationManager
    
    init() {
        self.locationManager = CLLocationManager()
        self.locationController = LocationService(manager: self.locationManager)
        self.runningLocationUsecase = LocationUsecaseImp(locationController: self.locationController)
        self.runningStatusViewModel = RunningStatusViewModel(locationUsecase: self.runningLocationUsecase)
    }
}
