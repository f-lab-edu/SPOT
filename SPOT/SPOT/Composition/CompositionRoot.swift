//
//  CompositionRoot.swift
//  SPOT
//
//  Created by 김민식 on 2024/02/02.
//

import Combine
import CoreLocation
import CoreMotion
import SwiftUI

import AuthDataAccess
import AuthFeature
import AuthDataAccess
import GoogleLoginProxy
import GoogleSignIn
import KakaoLoginProxy
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import RunningFeature
import RunningDataAccess
import Controller
import Entity
import Usecase
import PersistanceDataAccess

class CompositionRoot {
    var beforeRunningFactory: any Factory
    var duringRunningFactory: any Factory
    var pauseRunningFactory: any Factory
    var stopRunningFactory: any Factory
    var countdownFactory: any Factory
    var loginFactory: any LoginFactory
    
    var dashboardUsecase: RunningDashboardUsecase
    var padUsecase: RunningPadUsecase
    var timerUsecase: TimerUsecase
    var loginUsecase: LoginUsecase
    var authorizationUsecase: RunningAuthorizationUsecase
    
    var locationController: LocationController
    var activityController: ActivityController
    var kakaoAuthController: AuthorizationController
    var googleAuthController: AuthorizationController
    var persistanceController: PersistanceController
    
    let locationManager: CLLocationManager
    var pedometer: CMPedometer
    let googleSignInConfig: GIDConfiguration
    let presentingViewController: UIViewController?
    let kakaoSDKAPPKey = "c9c8d578c14531682aef24a880009340"
    let userDefaults: UserDefaults
    let decoder: JSONDecoder
    let encoder: JSONEncoder
    let record: RunningRecord
    let recordTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    let beforeRunningViewModel: BeforeRnningViewModel
    let duringRunningViewModel: DuringRunningViewModel
    let dashboardViewModel: DashboardViewModel
    let countdownViewModel: CountdownViewModel
    let pauseRunningViewModel: PauseRunningViewModel
    let loginViewModel: LoginViewModel
    
    init() {
        self.locationManager = CLLocationManager()
        self.pedometer = CMPedometer()
        self.userDefaults = UserDefaults()
        self.decoder = JSONDecoder()
        self.encoder = JSONEncoder()
        self.record = RunningRecord()
        KakaoSDK.initSDK(appKey: kakaoSDKAPPKey)
        
        self.locationController = LocationService(manager: self.locationManager)
        self.activityController = ActivityService(pedometer: self.pedometer)
        self.kakaoAuthController = KakaoAuthService(userAPI: UserApi.self)
        self.googleSignInConfig = GIDConfiguration(clientID: "702300377706-ral8jq5143lrrqlqvmbaoa8hg098lkjq.apps.googleusercontent.com")
        self.presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController
        self.googleAuthController = GoogleAuthService(signInConfig: self.googleSignInConfig, presentingViewController: self.presentingViewController ?? UIViewController())
        self.persistanceController = UserDefaultsService(userdefaults: self.userDefaults,
                                                         decoder: self.decoder,
                                                         encoder: self.encoder)
        
        self.timerUsecase = TimerUsecaseImp()
        self.dashboardUsecase = RunningDashboardUsecaseImp(locationController: self.locationController,
                                                           activityController: self.activityController,
                                                           persistanceController: self.persistanceController,
                                                           record: self.record,
                                                           timerUsecase: self.timerUsecase,
                                                           recordTimer: self.recordTimer)
        self.padUsecase = RunningPadUsecaseImp(locationController: self.locationController,
                                               activityController: self.activityController)
        self.authorizationUsecase = RunningAuthorizationUsecaseImp(locationController: self.locationController,
                                                                   activityController: self.activityController)
        self.loginUsecase = LoginUsecaseImp(kakaoAuthController: self.kakaoAuthController,
                                          googleAuthController: self.googleAuthController)
        
        self.beforeRunningViewModel = BeforeRnningViewModel(authorizationUsecase: self.authorizationUsecase)
        self.duringRunningViewModel = DuringRunningViewModel(padUsecase: self.padUsecase, timerUsecase: self.timerUsecase)
        self.dashboardViewModel = DashboardViewModel(dashboardUsecase: self.dashboardUsecase)
        self.countdownViewModel = CountdownViewModel(padUsecase: self.padUsecase,
                                                     timerUsecase: self.timerUsecase,
                                                     currentDate: Date.init)
        self.pauseRunningViewModel = PauseRunningViewModel(dashboardUsecase: self.dashboardUsecase)
        self.loginViewModel = LoginViewModel(loginUsecase: self.loginUsecase)
        self.loginUsecase = LoginUsecaseImp(kakaoAuthController: self.kakaoAuthController,
                                            googleAuthController: self.googleAuthController)
        
        
        self.beforeRunningFactory = BeforeRunningFactoryImp(locationViewModel: self.beforeRunningViewModel)
        self.duringRunningFactory = DuringRunningFactoryImp(dashboardViewModel: self.dashboardViewModel,
                                                            viewModel: self.duringRunningViewModel)
        self.pauseRunningFactory = PauseRunningFactoryImp(dashboardViewModel: self.dashboardViewModel,
                                                          pauseRunningViewModel: self.pauseRunningViewModel)
        self.stopRunningFactory = StopRunningFactoryImp()
        self.countdownFactory = CountdownFactoryImp(viewModel: self.countdownViewModel)
        self.loginFactory = LoginFactoryImp(viewModel: self.loginViewModel)
    }
    
    func validateURL(_ url: URL) {
        if AuthApi.isKakaoTalkLoginUrl(url) {
            _ = AuthController.handleOpenUrl(url: url)
        } else if GIDSignIn.sharedInstance.handle(url) {
            
        }
    }
}
