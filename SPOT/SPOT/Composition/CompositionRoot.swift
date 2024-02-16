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
    var beforeRunningFactory: any Factory
    var duringRunningFactory: any Factory
    var pauseRunningFactory: any Factory
    var stopRunningFactory: any Factory
    var runningStatus: RunningStatus
    var runningLocationUsecase: LocationUsecaseImp
    var locationController: LocationController
    let locationManager: CLLocationManager
    let runningLocationViewModel: RunningLocationViewModel
    
    init() {
        self.locationManager = CLLocationManager()
        self.locationController = LocationService(manager: self.locationManager)
        self.runningLocationUsecase = LocationUsecaseImp(locationController: self.locationController)
        self.runningLocationViewModel = RunningLocationViewModel(locationUsecase: runningLocationUsecase)
        self.runningStatus = RunningStatus()
        self.beforeRunningFactory = BeforeRunningFactoryImp(locationViewModel: self.runningLocationViewModel)
        self.duringRunningFactory = DuringRunningFactoryImp()
        self.pauseRunningFactory = PauseRunningFactoryImp()
        self.stopRunningFactory = StopRunningFactoryImp()
    }
}
