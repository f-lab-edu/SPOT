//
//  StartButton.swift
//  
//
//  Created by 김민식 on 2024/02/16.
//

import SwiftUI

struct StartButton: View {
    @ObservedObject var status: RunningStatus
    @ObservedObject var viewModel: BeforeRnningViewModel
    
    var body: some View {
        Button {
            viewModel.requestAuthorization {
                status.uiState = .countdown
            }
        } label: {
            Image(systemName: "arrowtriangle.right.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.black)
        }
    }
}
