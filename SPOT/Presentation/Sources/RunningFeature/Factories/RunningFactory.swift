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
    private let dashboardFactory: any Factory
    let controlUsecase: RunningControlUsecase
    let timerUsecase: TimerUsecase
    
    public init(dashboardFactory: some Factory,
                controlUsecase: RunningControlUsecase,
                timerUsecase: TimerUsecase) {
        self.dashboardFactory = dashboardFactory
        self.controlUsecase = controlUsecase
        self.timerUsecase = timerUsecase
    }
    
    public func make() -> DuringRunning {
        let viewModel = DuringRunningViewModel(controlUsecase: controlUsecase, timerUsecase: timerUsecase)
        return DuringRunning(dashboardFactory: dashboardFactory, viewModel: viewModel)
    }
}

public struct PauseRunningFactoryImp: Factory {
    private let dashboardFactory: any Factory
    let streamUsecase: RunningStreamUsecase
    let controlUsecase: RunningControlUsecase
    let timerUsecase: TimerUsecase
    
    public init(dashboardFactory: some Factory, streamUsecase: RunningStreamUsecase, controlUsecase: RunningControlUsecase, timerUsecase: TimerUsecase) {
        self.dashboardFactory = dashboardFactory
        self.streamUsecase = streamUsecase
        self.controlUsecase = controlUsecase
        self.timerUsecase = timerUsecase
    }
    
    public func make() -> PauseRunning {
        let pauseRunningViewModel = PauseRunningViewModel(streamUsecase: streamUsecase, controlUsecase: controlUsecase, timerUsecase: timerUsecase)
        
        return PauseRunning(dashboardFactory: dashboardFactory, pauseRunningViewModel: pauseRunningViewModel)
    }
}

public struct StopRunningFactoryImp: Factory {
    private let dashboardFactory: any Factory
    let runningRecordUsecase: RunningRecordUsecase
    let dateFormatter: DateFormatter
    let calendar: Calendar.Type
    
    public init(dashboardFactory: some Factory,
                runningRecordUsecase: RunningRecordUsecase,
                dateFormatter: DateFormatter,
                calendar: Calendar.Type) {
        self.dashboardFactory = dashboardFactory
        self.runningRecordUsecase = runningRecordUsecase
        self.dateFormatter = dateFormatter
        self.calendar = calendar
    }
    
    public func make() -> StopRunning {
        let stopRunningViewModel = StopRunningViewModel(runningRecordUsecase: runningRecordUsecase,
                                                        dateFormatter: dateFormatter,
                                                        calendar: calendar)
        return StopRunning(dashboardFactory: dashboardFactory,
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

public struct DashboardFactoryImp: Factory {
    private let streamUsecase: RunningStreamUsecase
    
    public init(streamUsecase: RunningStreamUsecase) {
        self.streamUsecase = streamUsecase
    }
    
    public func make() -> DashboardView {
        let viewModel = DashboardViewModel(streamUsecase: streamUsecase)
        
        return DashboardView(viewModel: viewModel)
    }
}
