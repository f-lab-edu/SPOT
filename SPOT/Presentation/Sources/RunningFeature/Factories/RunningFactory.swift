//
//  RunningFactory.swift
//
//
//  Created by 김민식 on 2024/02/16.
//

import SwiftUI

import Usecase

public protocol Factory {
    associatedtype SomeView: View
    
    func make() -> SomeView
}

public struct BeforeRunningFactoryImp: Factory {
    let authorizationUsecase: RunningAuthorizationUsecase
    
    public init(authorizationUsecase: RunningAuthorizationUsecase) {
        self.authorizationUsecase = authorizationUsecase
    }
    
    public func make() -> BeforeRunning {
        let locationViewModel = BeforeRnningViewModel(authorizationUsecase: self.authorizationUsecase)
        return BeforeRunning(viewModel: locationViewModel)
    }
}

public struct DuringRunningFactoryImp: Factory {
    let dashboardViewModel: DashboardViewModel
    let controlUsecase: RunningControlUsecase
    let timerUsecase: TimerUsecase
    
    public init(dashboardViewModel: DashboardViewModel,
                controlUsecase: RunningControlUsecase, 
                timerUsecase: TimerUsecase) {
        self.dashboardViewModel = dashboardViewModel
        self.controlUsecase = controlUsecase
        self.timerUsecase = timerUsecase
    }
    
    public func make() -> DuringRunning {
        let viewModel = DuringRunningViewModel(controlUsecase: controlUsecase, timerUsecase: timerUsecase)
        return DuringRunning(dashboardViewModel: dashboardViewModel, viewModel: viewModel)
    }
}

public struct PauseRunningFactoryImp: Factory {
    let dashboardViewModel: DashboardViewModel
    let streamUsecase: RunningStreamUsecase
    let controlUsecase: RunningControlUsecase
    let timerUsecase: TimerUsecase
    
    public init(dashboardViewModel: DashboardViewModel, streamUsecase: RunningStreamUsecase, controlUsecase: RunningControlUsecase, timerUsecase: TimerUsecase) {
        self.dashboardViewModel = dashboardViewModel
        self.streamUsecase = streamUsecase
        self.controlUsecase = controlUsecase
        self.timerUsecase = timerUsecase
    }
    
    public func make() -> PauseRunning {
        let pauseRunningViewModel = PauseRunningViewModel(streamUsecase: streamUsecase, controlUsecase: controlUsecase, timerUsecase: timerUsecase)
        
        return PauseRunning(dashboardViewModel: dashboardViewModel, pauseRunningViewModel: pauseRunningViewModel)
    }
}

public struct StopRunningFactoryImp: Factory {
    let dashboardViewModel: DashboardViewModel
    let runningRecordUsecase: RunningRecordUsecase
    let dateFormatter: DateFormatter
    let calendar: Calendar.Type
    
    public init(dashboardViewModel: DashboardViewModel,
                runningRecordUsecase: RunningRecordUsecase,
                dateFormatter: DateFormatter,
                calendar: Calendar.Type) {
        self.dashboardViewModel = dashboardViewModel
        self.runningRecordUsecase = runningRecordUsecase
        self.dateFormatter = dateFormatter
        self.calendar = calendar
    }
    
    public func make() -> StopRunning {
        let stopRunningViewModel = StopRunningViewModel(runningRecordUsecase: runningRecordUsecase,
                                                        dateFormatter: dateFormatter,
                                                        calendar: calendar)
        return StopRunning(dashboardViewModel: dashboardViewModel,
                    stopRunningViewModel: stopRunningViewModel)
    }
}

public struct CountdownFactoryImp: Factory {
    private let controlUsecase: RunningControlUsecase
    private let timerUsecase: TimerUsecase
    
    public init(controlUsecase: RunningControlUsecase, timerUsecase: TimerUsecase) {
        self.controlUsecase = controlUsecase
        self.timerUsecase = timerUsecase
    }
    
    public func make() -> CountdownView {
        let viewModel = CountdownViewModel(controlUsecase: controlUsecase,
                                           timerUsecase: timerUsecase,
                                           currentDate: Date.init)
        return CountdownView(viewModel: viewModel)
    }
}
