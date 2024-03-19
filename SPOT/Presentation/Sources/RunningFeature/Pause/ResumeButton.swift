//
//  ResumeButton.swift
//
//
//  Created by 10004 on 2/15/24.
//

import SwiftUI

struct ResumeButton: View {
    @ObservedObject var status: RunningStatus
    @ObservedObject var pauseRunningViewModel: PauseRunningViewModel
    
    var body: some View {
        Button {
            pauseRunningViewModel.resume {
                status.uiState = .during
            }
        } label: {
            Image(systemName: "arrowtriangle.right.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.black)
        }
    }
}
