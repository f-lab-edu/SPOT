//
//  ContentView.swift
//  SPOT
//
//  Created by 만리자 on 1/13/24.
//

import SwiftUI

import RunningFeature

struct ContentView: View {
    private let beforeRunningFactory: any Factory
    private let duringRunningFactory: any Factory
    private let pauseRunningFactory: any Factory
    private let stopRunningFactory: any Factory
    private let countdownFactory: any Factory
    
    init(beforeRunningFactory: any Factory,
         duringRunningFactory: any Factory,
         pauseRunningFactory: any Factory,
         stopRunningFactory: any Factory,
         countdownFactory: any Factory) {
        self.beforeRunningFactory = beforeRunningFactory
        self.duringRunningFactory = duringRunningFactory
        self.pauseRunningFactory = pauseRunningFactory
        self.stopRunningFactory = stopRunningFactory
        self.countdownFactory = countdownFactory
    }
    
    var body: some View {
        AnyView(
            RunningStatusView(
                beforeRunningFactory: beforeRunningFactory,
                duringRunningFactory: duringRunningFactory,
                pauseRunningFactory: pauseRunningFactory,
                stopRunningFactory: stopRunningFactory,
                countdownFactory: countdownFactory
            )
        )
    }
}
