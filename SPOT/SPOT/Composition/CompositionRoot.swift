//
//  CompositionRoot.swift
//  SPOT
//
//  Created by 김민식 on 2024/02/02.
//

import CoreLocation
import CoreMotion
import SwiftUI

import AuthFeature
import GoogleLoginProxy
import KakaoLoginProxy
import KakaoSDKCommon
import KakaoSDKAuth
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
    
    var dashboardUsecase: RunningDashboardUsecase
    var timerUsecase: TimerUsecase
    
    var locationController: LocationController
    var activityController: ActivityController
    
    let locationManager: CLLocationManager
    var pedometer: CMPedometer
    let kakaoSDKAPPKey = "c9c8d578c14531682aef24a880009340"
    
    let runningLocationViewModel: BeforeRnningViewModel
    let dashboardViewModel: DashboardViewModel
    
    init() {
        self.locationManager = CLLocationManager()
        self.pedometer = CMPedometer()
        KakaoSDK.initSDK(appKey: kakaoSDKAPPKey)
        
        self.locationController = LocationService(manager: self.locationManager)
        self.activityController = ActivityService(pedometer: self.pedometer)
        
        self.dashboardUsecase = RunningDashboardUsecaseImp(locationController: self.locationController,
                                                           activityController: self.activityController)
        self.timerUsecase = TimerUsecaseImp()
        
        self.runningLocationViewModel = BeforeRnningViewModel()
        self.dashboardViewModel = DashboardViewModel(dashboardUsecase: self.dashboardUsecase,
                                                     timerUsecase: self.timerUsecase)
        
        self.beforeRunningFactory = BeforeRunningFactoryImp(locationViewModel: self.runningLocationViewModel)
        self.duringRunningFactory = DuringRunningFactoryImp(dashboardViewModel: self.dashboardViewModel)
        self.pauseRunningFactory = PauseRunningFactoryImp(dashboardViewModel: self.dashboardViewModel)
        self.stopRunningFactory = StopRunningFactoryImp()
    }
    
    func validateURL(_ url: URL) {
        if AuthApi.isKakaoTalkLoginUrl(url) {
            _ = AuthController.handleOpenUrl(url: url)
        }
    }
}
