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
import RunningFeature
import RunningDataAccess
import Controller
import Usecase

class CompositionRoot {
    var beforeRunningFactory: any Factory
    var duringRunningFactory: any Factory
    var pauseRunningFactory: any Factory
    var stopRunningFactory: any Factory
    var countdownFactory: any Factory
    
    var dashboardUsecase: RunningDashboardUsecase
    var padUsecase: RunningPadUsecase
    var timerUsecase: TimerUsecase
    
    var locationController: LocationController
    var activityController: ActivityController
    
    let locationManager: CLLocationManager
    var pedometer: CMPedometer
    let kakaoSDKAPPKey = "c9c8d578c14531682aef24a880009340"
    
    let beforeRunningViewModel: BeforeRnningViewModel
    let duringRunningViewModel: DuringRunningViewModel
    let dashboardViewModel: DashboardViewModel
    
    init() {
        self.locationManager = CLLocationManager()
        self.pedometer = CMPedometer()
        KakaoSDK.initSDK(appKey: kakaoSDKAPPKey)
        
        self.locationController = LocationService(manager: self.locationManager)
        self.activityController = ActivityService(pedometer: self.pedometer)
        
        self.dashboardUsecase = RunningDashboardUsecaseImp(locationController: self.locationController,
                                                           activityController: self.activityController)
        self.padUsecase = RunningPadUsecaseImp(locationController: self.locationController,
                                               activityController: self.activityController)
        self.timerUsecase = TimerUsecaseImp()
        
        self.beforeRunningViewModel = BeforeRnningViewModel(padUsecase: self.padUsecase, timerUsecase: self.timerUsecase, currentDate: Date.init)
        self.duringRunningViewModel = DuringRunningViewModel(padUsecase: self.padUsecase, timerUsecase: self.timerUsecase)
        self.dashboardViewModel = DashboardViewModel(dashboardUsecase: self.dashboardUsecase,
                                                     timerUsecase: self.timerUsecase)
        
        self.beforeRunningFactory = BeforeRunningFactoryImp(locationViewModel: self.beforeRunningViewModel)
        self.duringRunningFactory = DuringRunningFactoryImp(dashboardViewModel: self.dashboardViewModel, 
                                                            viewModel: self.duringRunningViewModel)
        self.pauseRunningFactory = PauseRunningFactoryImp(dashboardViewModel: self.dashboardViewModel)
        self.stopRunningFactory = StopRunningFactoryImp()
        self.countdownFactory = CountdownFactoryImp(viewModel: self.beforeRunningViewModel)
    }
    
    func validateURL(_ url: URL) {
        if AuthApi.isKakaoTalkLoginUrl(url) {
            _ = AuthController.handleOpenUrl(url: url)
        }
    }
}
