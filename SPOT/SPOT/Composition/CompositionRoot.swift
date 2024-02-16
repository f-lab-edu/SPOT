//
//  CompositionRoot.swift
//  SPOT
//
//  Created by 김민식 on 2024/02/02.
//

import CoreLocation
import CoreMotion
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
    
    var runningLocationUsecase: LocationUsecaseImp
    var activityUsecase: ActivityUsecase
    var timerUsecase: TimerUsecase
    
    var locationController: LocationController
    var activityController: ActivityController
    
    let locationManager: CLLocationManager
    var pedometer: CMPedometer
    
    let runningLocationViewModel: BeforeRnningViewModel
    let dashboardViewModel: DashboardViewModel
    
    init() {
        self.locationManager = CLLocationManager()
        self.pedometer = CMPedometer()
        
        self.locationController = LocationService(manager: self.locationManager)
        self.activityController = ActivityService(pedometer: self.pedometer)
        
        self.runningLocationUsecase = LocationUsecaseImp(locationController: self.locationController)
        self.activityUsecase = ActivityUsecaseImp(activityController: self.activityController)
        self.timerUsecase = TimerUsecaseImp()
        
        self.runningLocationViewModel = BeforeRnningViewModel(locationUsecase: runningLocationUsecase)
        self.dashboardViewModel = DashboardViewModel(activityUsecase: self.activityUsecase,
                                                     timerUsecase: self.timerUsecase)
        
        self.beforeRunningFactory = BeforeRunningFactoryImp(locationViewModel: self.runningLocationViewModel)
        self.duringRunningFactory = DuringRunningFactoryImp(dashboardViewModel: self.dashboardViewModel)
        self.pauseRunningFactory = PauseRunningFactoryImp(dashboardViewModel: self.dashboardViewModel)
        self.stopRunningFactory = StopRunningFactoryImp()
    }
}
