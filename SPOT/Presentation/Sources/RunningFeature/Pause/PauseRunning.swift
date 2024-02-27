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
    
    @StateObject  private var dashboardViewModel: DashboardViewModel
    @StateObject private var pauseRunningViewModel: PauseRunningViewModel
    
    public init(dashboardViewModel: DashboardViewModel, pauseRunningViewModel: PauseRunningViewModel) {
        _dashboardViewModel = StateObject(wrappedValue: dashboardViewModel)
        _pauseRunningViewModel = StateObject(wrappedValue: pauseRunningViewModel)
    }
    
    public var body: some View {
        Map {
            MapPolyline(coordinates: [])
                .stroke(.orange, lineWidth: 10)
        }
        
        VStack(alignment: .center) {
            DashboardView(viewModel: dashboardViewModel)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                ResumeButton(status: status)
                
                StopButton(status: status)
            }
            .frame(height: 100)
        }
        .onReceive(pauseRunningViewModel.$locations) { locations in
            
        }
    }
}
