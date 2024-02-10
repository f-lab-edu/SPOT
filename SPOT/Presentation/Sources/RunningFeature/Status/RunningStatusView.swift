//
//  RunningStatusView.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import SwiftUI

import LocationFeature

public struct RunningStatusView: View {
    @ObservedObject var status: RunningStatus
    
    public init(status: RunningStatus) {
        self.status = status
    }
    
    public var body: some View {
        Content(status: status)
    }
}

// MARK: - Content
extension RunningStatusView {
    struct Content: View {
        @ObservedObject var status: RunningStatus
        
        var body: some View {
            Group {
                switch status.uiState {
                case .before:
                    BeforeRunning(status: status)
                case .startCountdown:
                    Text("startCountdown")
                case .run:
                    Text("run")
                case .pause:
                    Text("pause")
                case .stop:
                    Text("stop")
                }
            }
        }
    }
}
