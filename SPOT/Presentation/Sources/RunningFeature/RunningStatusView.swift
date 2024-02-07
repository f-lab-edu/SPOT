//
//  RunningStatusView.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import SwiftUI

import LocationFeature

public struct RunningStatusView: View {
    @ObservedObject var viewModel: RunningStatusViewModel
    
    public init(viewModel: RunningStatusViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Content(viewModel: viewModel)
    }
}

// MARK: - Content
extension RunningStatusView {
    struct Content: View {
        @ObservedObject var viewModel: RunningStatusViewModel
        
        var body: some View {
            Group {
                switch viewModel.uiState {
                case .before:
                    BeforeRunning(viewModel: viewModel)
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

// MARK: - Before View
extension RunningStatusView {
    struct BeforeRunning: View {
        @ObservedObject var viewModel: RunningStatusViewModel
        
        var body: some View {
            VStack(alignment: .center) {
                GPSStatusView()
                
                Spacer()
                
                Text("추후 아이데이션")
                    .font(.system(size: 40))
                    .foregroundStyle(.gray)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 20) {
                    StartRunningButton(viewModel: viewModel)
                    
                    SettingButton()
                }
                .frame(height: 100)
            }
        }
    }
}


// MARK: - GPS State
extension RunningStatusView {
    struct GPSStatusView: View {
        var body: some View {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 2) {
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.green)
                
                Text("gps")
            }
            .frame(height: 80)
        }
    }
}


//MARK: - Start Button
extension RunningStatusView {
    struct StartRunningButton: View {
        @ObservedObject var viewModel: RunningStatusViewModel
        
        var body: some View {
            Button {
                viewModel.startRunningButtonTapped()
            } label: {
                Image(systemName: "arrowtriangle.right.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.black)
            }
        }
    }
}

//MARK: - Start Button
extension RunningStatusView {
    struct SettingButton: View {
        var body: some View {
            Button {
                
            } label: {
                Image(systemName: "gearshape.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.gray)

            }
        }
    }
}
