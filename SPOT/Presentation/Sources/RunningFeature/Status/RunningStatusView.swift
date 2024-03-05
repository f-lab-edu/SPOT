//
//  RunningStatusView.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import SwiftUI

public struct RunningStatusView: View {
    @StateObject private var status: RunningStatus = .init()
    
    private let beforeRunningFactory: any Factory
    private let duringRunningFactory: any Factory
    private let pauseRunningFactory: any Factory
    private let stopRunningFactory: any Factory
    private let countdownFactory: any Factory
    
    public init(
        beforeRunningFactory: some Factory,
        duringRunningFactory: some Factory,
        pauseRunningFactory: some Factory,
        stopRunningFactory: some Factory,
        countdownFactory: some Factory) {
            self.beforeRunningFactory = beforeRunningFactory
            self.duringRunningFactory = duringRunningFactory
            self.pauseRunningFactory = pauseRunningFactory
            self.stopRunningFactory = stopRunningFactory
            self.countdownFactory = countdownFactory
        }
    
    public var body: some View {
        AnyView {
            switch status.uiState {
            case .before:
                beforeRunningFactory.make()
            case .countdown:
                countdownFactory.make()
            case .during:
                duringRunningFactory.make()
            case .pause:
                pauseRunningFactory.make()
            case .stop:
                stopRunningFactory.make()
            }
        }
        .environmentObject(status)
    }
}
