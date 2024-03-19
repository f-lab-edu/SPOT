//
//  PauseButton.swift
//
//
//  Created by 10004 on 2/14/24.
//

import SwiftUI

struct PauseButton: View {
    @ObservedObject var status: RunningStatus
    @ObservedObject var viewModel: DuringRunningViewModel
    
    var body: some View {
        Button {
            viewModel.pause {
                status.uiState = .pause
            }
        } label: {
            Image(systemName: "pause.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.purple)
        }
    }
}
