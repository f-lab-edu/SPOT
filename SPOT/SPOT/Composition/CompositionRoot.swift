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
import AuthDataAccess
import GoogleLoginProxy
import GoogleSignIn
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
    var loginFactory: any LoginFactory
    
    var dashboardUsecase: RunningDashboardUsecase
    var timerUsecase: TimerUsecase
    var authUsecase: AuthUsecase
    
    var locationController: LocationController
    var activityController: ActivityController
    var kakaoAuthController: AuthorizationController
    var googleAuthController: AuthorizationController
    
    let locationManager: CLLocationManager
    var pedometer: CMPedometer
    let googleSignInConfig: GIDConfiguration
    let presentingViewController: UIViewController?
    let kakaoSDKAPPKey = "c9c8d578c14531682aef24a880009340"
    
    let runningLocationViewModel: BeforeRnningViewModel
    let dashboardViewModel: DashboardViewModel
    let loginViewModel: LoginViewModel
    
    init() {
        self.locationManager = CLLocationManager()
        self.pedometer = CMPedometer()
        KakaoSDK.initSDK(appKey: kakaoSDKAPPKey)
        
        self.locationController = LocationService(manager: self.locationManager)
        self.activityController = ActivityService(pedometer: self.pedometer)
        self.kakaoAuthController = KakaoAuthService()
        self.googleSignInConfig = GIDConfiguration(clientID: "702300377706-ral8jq5143lrrqlqvmbaoa8hg098lkjq.apps.googleusercontent.com")
        self.presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController
        self.googleAuthController = GoogleAuthService(signInConfig: self.googleSignInConfig, presentingViewController: self.presentingViewController ?? UIViewController())
        
        self.dashboardUsecase = RunningDashboardUsecaseImp(locationController: self.locationController,
                                                           activityController: self.activityController)
        self.timerUsecase = TimerUsecaseImp()
        self.authUsecase = AuthUsecaseImp(kakaoAuthController: self.kakaoAuthController,
                                          googleAuthController: self.googleAuthController)
        
        self.runningLocationViewModel = BeforeRnningViewModel()
        self.dashboardViewModel = DashboardViewModel(dashboardUsecase: self.dashboardUsecase,
                                                     timerUsecase: self.timerUsecase)
        self.loginViewModel = LoginViewModel(authUsecase: self.authUsecase)
        
        self.beforeRunningFactory = BeforeRunningFactoryImp(locationViewModel: self.runningLocationViewModel)
        self.duringRunningFactory = DuringRunningFactoryImp(dashboardViewModel: self.dashboardViewModel)
        self.pauseRunningFactory = PauseRunningFactoryImp(dashboardViewModel: self.dashboardViewModel)
        self.stopRunningFactory = StopRunningFactoryImp()
        self.loginFactory = LoginFactoryImp(viewModel: self.loginViewModel)
    }
    
    func validateURL(_ url: URL) {
        if AuthApi.isKakaoTalkLoginUrl(url) {
            _ = AuthController.handleOpenUrl(url: url)
        } else if GIDSignIn.sharedInstance.handle(url) {
            
        }
    }
}
