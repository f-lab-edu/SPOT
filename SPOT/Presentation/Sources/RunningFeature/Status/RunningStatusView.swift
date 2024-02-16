//
//  RunningStatusView.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import SwiftUI

import LocationFeature

public struct RunningStatusView: View {
    @StateObject private var status: RunningStatus = .init()
    
    private let beforeRunningFactory: any Factory
    private let duringRunningFactory: any Factory
    private let pauseRunningFactory: any Factory
    private let stopRunningFactory: any Factory
    
    public init(
         beforeRunningFactory: any Factory,
         duringRunningFactory: any Factory,
         pauseRunningFactory: any Factory,
         stopRunningFactory: any Factory) {
        self.beforeRunningFactory = beforeRunningFactory
        self.duringRunningFactory = duringRunningFactory
        self.pauseRunningFactory = pauseRunningFactory
        self.stopRunningFactory = stopRunningFactory
    }
    
    public var body: some View {
        Group {
            switch status.uiState {
            case .before:
                AnyView(beforeRunningFactory.make())
            case .startCountdown:
                Text("startCountdown")
            case .during:
                AnyView(duringRunningFactory.make())
            case .pause:
                AnyView(pauseRunningFactory.make())
            case .stop:
                AnyView(stopRunningFactory.make())
            }
        }
    }
}
