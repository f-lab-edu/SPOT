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
    let locationViewModel: RunningLocationViewModel
    
    public init(locationViewModel: RunningLocationViewModel) {
        self.locationViewModel = locationViewModel
    }
    
    public func make() -> some View {
        BeforeRunning(viewModel: locationViewModel)
    }
}

public struct DuringRunningFactoryImp: Factory {
    public init() {}
    
    public func make() -> some View {
        DuringRunning()
    }
}

public struct PauseRunningFactoryImp: Factory {
    public init() {}
    
    public func make() -> some View {
        PauseRunning()
    }
}

public struct StopRunningFactoryImp: Factory {
    public init() {}
    
    public func make() -> some View {
        StopRunning()
    }
}