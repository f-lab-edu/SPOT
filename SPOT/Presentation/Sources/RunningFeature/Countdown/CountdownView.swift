//
//  CountdownView.swift
//
//
//  Created by 10004 on 2/14/24.
//

import SwiftUI

public struct CountdownView: View {
    @EnvironmentObject private var status: RunningStatus
    @State private var timeRemaining = 3
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let viewModel: CountdownViewModel
    
    public init(viewModel: CountdownViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    viewModel.start {
                        status.uiState = .during
                    }
                } label: {
                    Text("건너뛰기")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
                .padding()
            }
            
            Spacer()
            
            Text("\(timeRemaining)")
                .font(.system(size: 50, weight: .bold))
                .onReceive(timer) { _ in
                    if timeRemaining > 1 {
                        timeRemaining -= 1
                    } else {
                        viewModel.start { status.uiState = .during }
                    }
                }
            
            Spacer()
        }
    }
}
