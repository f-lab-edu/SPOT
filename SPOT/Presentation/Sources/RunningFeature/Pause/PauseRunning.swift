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
    @State private var position: MapCameraPosition = .userLocation(fallback: .camera(MapCamera(centerCoordinate: .init(), distance: 0)))
    
    private var dashboardFactory: any Factory
    @StateObject private var pauseRunningViewModel: PauseRunningViewModel
    
    public init(dashboardFactory: some Factory, pauseRunningViewModel: PauseRunningViewModel) {
        self.dashboardFactory = dashboardFactory
        _pauseRunningViewModel = StateObject(wrappedValue: pauseRunningViewModel)
    }
    
    public var body: some View {
        Map(position: $position) {
            MapPolyline(coordinates: pauseRunningViewModel.locations.map { CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude) })
                .stroke(.orange, lineWidth: 4)
        }
        
        VStack(alignment: .center) {
            AnyView(dashboardFactory.make())
            
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                ResumeButton(status: status, pauseRunningViewModel: pauseRunningViewModel)
                
                StopButton(status: status, pauseRunningViewModel: pauseRunningViewModel)
            }
            .frame(height: 100)
        }
    }
}
