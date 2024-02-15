//
//  RunningFactory.swift
//  SPOT
//
//  Created by 10004 on 2/12/24.
//

import SwiftUI

import RunningFeature

protocol RunningFactory {
    associatedtype BeforeRunningView: View
    associatedtype DuringRunningView: View
    associatedtype PauseRunningView: View
    associatedtype StopRunningView: View
    
    func makeBeforeRunning() -> BeforeRunningView
    func makeDuringRunning() -> DuringRunningView
    func makePauseRunning() -> PauseRunningView
    func makeStopRunning() -> StopRunningView
}

struct RunningFactoryImp: RunningFactory {
    let locationViewModel: RunningLocationViewModel
    
    init(locationViewModel: RunningLocationViewModel) {
        self.locationViewModel = locationViewModel
    }
    
    @ViewBuilder func makeBeforeRunning() -> BeforeRunning {
        BeforeRunning(viewModel: locationViewModel)
    }
    
    @ViewBuilder func makeDuringRunning() -> DuringRunning {
        DuringRunning()
    }
    
    @ViewBuilder func makePauseRunning() -> PauseRunning {
        PauseRunning()
    }
    
    @ViewBuilder func makeStopRunning() -> StopRunning {
        StopRunning()
    }
}
