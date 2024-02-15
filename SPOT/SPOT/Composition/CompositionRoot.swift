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
    var runningFactory: any RunningFactory
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
        self.runningFactory = RunningFactoryImp(locationViewModel: self.runningLocationViewModel)
    }
}
