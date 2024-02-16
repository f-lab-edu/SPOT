//
//  RunningBeforeFactory.swift
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
    
    public func make() -> some View {
        BeforeRunning(viewModel: locationViewModel)
    }
}

public struct DuringRunningFactoryImp: Factory {
    let dashboardViewModel: DashboardViewModel
    
    public init(dashboardViewModel: DashboardViewModel) {
        self.dashboardViewModel = dashboardViewModel
    }
    
    public func make() -> some View {
        DuringRunning(dashboardViewModel: dashboardViewModel)
    }
}

public struct PauseRunningFactoryImp: Factory {
    let dashboardViewModel: DashboardViewModel
    
    public init(dashboardViewModel: DashboardViewModel) {
        self.dashboardViewModel = dashboardViewModel
    }
    
    public func make() -> some View {
        PauseRunning(dashboardViewModel: dashboardViewModel)
    }
}

public struct StopRunningFactoryImp: Factory {
    public init() {}
    
    public func make() -> some View {
        StopRunning()
    }
}
