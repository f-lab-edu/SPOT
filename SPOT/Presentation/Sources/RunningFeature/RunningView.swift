//
//  RunningView.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import SwiftUI

struct RunningView: View {
    @ObservedObject var viewModel: RunningViewModel
    
    init(viewModel: RunningViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Content(viewModel: viewModel)
    }
}

// MARK: - Content
extension RunningView {
    struct Content: View {
        @ObservedObject var viewModel: RunningViewModel
        
        var body: some View {
            Group {
                switch viewModel.uiState {
                case .before:
                    Text("before")
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

// MARK: - GPS State
extension RunningView {
    struct GPSStatus: View {
        var body: some View {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 2) {
                Circle()
                    .frame(width: 10, height: 10)
                    .background(.green)
            }
        }
    }
}


#Preview {
    RunningView()
}
