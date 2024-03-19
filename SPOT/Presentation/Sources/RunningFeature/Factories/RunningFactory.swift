//
//  RunningFactory.swift
//
//
//  Created by 김민식 on 2024/02/16.
//

import SwiftUI

public protocol Factory {
    associatedtype SomeView: View
    
    func make() -> SomeView
}

public struct BeforeRunningFactoryImp: Factory {
    let locationViewModel: BeforeRnningViewModel
    
    public init(locationViewModel: BeforeRnningViewModel) {
        self.locationViewModel = locationViewModel
    }
    
    public func make() -> BeforeRunning {
        BeforeRunning(viewModel: locationViewModel)
    }
}

public struct DuringRunningFactoryImp: Factory {
    let dashboardViewModel: DashboardViewModel
    let viewModel: DuringRunningViewModel
    
    public init(dashboardViewModel: DashboardViewModel, viewModel: DuringRunningViewModel) {
        self.dashboardViewModel = dashboardViewModel
        self.viewModel = viewModel
    }
    
    public func make() -> DuringRunning {
        DuringRunning(dashboardViewModel: dashboardViewModel, viewModel: viewModel)
    }
}

public struct PauseRunningFactoryImp: Factory {
    let dashboardViewModel: DashboardViewModel
    let pauseRunningViewModel: PauseRunningViewModel
    
    public init(dashboardViewModel: DashboardViewModel, pauseRunningViewModel: PauseRunningViewModel) {
        self.dashboardViewModel = dashboardViewModel
        self.pauseRunningViewModel = pauseRunningViewModel
    }
    
    public func make() -> PauseRunning {
        PauseRunning(dashboardViewModel: dashboardViewModel, pauseRunningViewModel: pauseRunningViewModel)
    }
}

public struct StopRunningFactoryImp: Factory {
    public init() {}
    
    public func make() -> StopRunning {
        StopRunning()
    }
}

public struct CountdownFactoryImp: Factory {
    let viewModel: CountdownViewModel
    
    public init(viewModel: CountdownViewModel) {
        self.viewModel = viewModel
    }
    
    public func make() -> CountdownView {
        CountdownView(viewModel: viewModel)
    }
}
