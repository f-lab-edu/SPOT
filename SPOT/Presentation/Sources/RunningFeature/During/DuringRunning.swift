//
//  DuringRunning.swift
//
//
//  Created by 김민식 on 2024/02/15.
//

import SwiftUI

public struct DuringRunning: View {
    private var dashboardViewModel: DashboardViewModel
    
    public init(dashboardViewModel: DashboardViewModel) {
        self.dashboardViewModel = dashboardViewModel
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 20) {
            GPSStatus()
            
            Spacer()
            
            DashboardView(viewModel: dashboardViewModel)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                PauseButton()
                
                MapButton()
            }
            .frame(height: 100)
        }
    }
}
