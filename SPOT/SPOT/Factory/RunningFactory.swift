//
//  RunningFactory.swift
//  SPOT
//
//  Created by 10004 on 2/12/24.
//

import SwiftUI

import RunningFeature

protocol RunningFactory {
    associatedtype SomeView: View
    
    func makeBeforeRunning(_ viewModel: RunningLocationViewModel) -> SomeView
}

struct RunningFactoryImp: RunningFactory {
    func makeBeforeRunning(_ viewModel: RunningLocationViewModel) -> BeforeRunning {
        
        return BeforeRunning(viewModel: viewModel)
    }
}
