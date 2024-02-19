//
//  PauseRunning.swift
//
//
//  Created by 김민식 on 2024/02/15.
//

import SwiftUI
import MapKit

public struct PauseRunning: View {
    @EnvironmentObject private var status: RunningStatus
    
    private var map = Map()
    private var dashboardViewModel: DashboardViewModel
    
    public init(dashboardViewModel: DashboardViewModel) {
        self.dashboardViewModel = dashboardViewModel
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            map
                .frame(maxWidth: .infinity)
                .frame(height: 400)
            
            Spacer()
            
            DashboardView(viewModel: dashboardViewModel)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                ResumeButton(status: status)
                
                StopButton(status: status)
            }
            .frame(height: 100)
        }
    }
}
