//
//  DuringRunning.swift
//
//
//  Created by 김민식 on 2024/02/15.
//

import SwiftUI

public struct DuringRunning: View {
    @EnvironmentObject private var status: RunningStatus
    
    private var dashboardFactory: any Factory
    @StateObject private var viewModel: DuringRunningViewModel
    
    public init(dashboardFactory: some Factory, viewModel: DuringRunningViewModel) {
        self.dashboardFactory = dashboardFactory
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 20) {
            GPSStatus()
            
            Spacer()
            
            AnyView(dashboardFactory.make())
            
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                PauseButton(status: status, viewModel: viewModel)
                
                MapButton()
            }
            .frame(height: 100)
        }
    }
}
