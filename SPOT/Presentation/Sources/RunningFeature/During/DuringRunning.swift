//
//  DuringRunning.swift
//
//
//  Created by 김민식 on 2024/02/15.
//

import SwiftUI

public struct DuringRunning: View {
    @EnvironmentObject private var status: RunningStatus
    
    private var dashboardViewModel: DashboardViewModel
    private var viewModel: DuringRunningViewModel
    
    public init(dashboardViewModel: DashboardViewModel, viewModel: DuringRunningViewModel) {
        self.dashboardViewModel = dashboardViewModel
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 20) {
            GPSStatus()
            
            Spacer()
            
            DashboardView(viewModel: dashboardViewModel)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                PauseButton(status: status)
                
                MapButton()
            }
            .frame(height: 100)
        }
        .onAppear {
            viewModel.start()
        }
    }
}
