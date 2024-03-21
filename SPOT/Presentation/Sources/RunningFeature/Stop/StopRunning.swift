//
//  StopRunning.swift
//
//
//  Created by 김민식 on 2024/02/15.
//

import SwiftUI
import MapKit

public struct StopRunning: View {
    @EnvironmentObject private var status: RunningStatus
    @State private var presentSheet = true
    @State private var selectedSegment = 0
    
    @StateObject private var dashboardViewModel: DashboardViewModel
    @StateObject private var stopRunningViewModel: StopRunningViewModel
    
    public init(dashboardViewModel: DashboardViewModel,
                stopRunningViewModel: StopRunningViewModel) {
        _dashboardViewModel = StateObject(wrappedValue: dashboardViewModel)
        _stopRunningViewModel = StateObject(wrappedValue: stopRunningViewModel)
    }
    
    public var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .center) {
                Map(interactionModes: .pan) {
                    
                }
                .frame(height: 340)
                
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $presentSheet) {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 20) {
                        Text("기록")
                            .font(.system(size: 22, weight: .bold))
                            .onTapGesture {
                                selectedSegment = 0
                            }
                            .foregroundColor(selectedSegment == 0 ? .black : .gray)
                            
                        
                        Text("잽리스트")
                            .font(.system(size: 22, weight: .bold))
                            .onTapGesture {
                                selectedSegment = 1
                            }
                            .foregroundColor(selectedSegment == 0 ? .gray : .black)
                    }
                    .padding(.horizontal)
                                      
                    if selectedSegment == 0 {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("\(stopRunningViewModel.dayOfWeek)" + " " + "\(stopRunningViewModel.isDaytime ? "주간" : "야간")" + " " + "러닝")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color("SpotPurple"))
                            Text(stopRunningViewModel.startedAt)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(.gray)
                            
                            DashboardView(viewModel: dashboardViewModel)
                        }
                        .padding(.horizontal)
                    } else {
                        Text("잽 리스트 TBD")
                    }
                }
                .interactiveDismissDisabled()
                .presentationDetents([.medium])
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                .padding(.top, 20)
            }
            
            HStack(spacing: 16) {
                Spacer()
                
                Button {
                    stopRunningViewModel.shareButtonTapped()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }

                Button {
                    stopRunningViewModel.closeButtonTapped {
                        status.uiState = .before
                    }
                } label: {
                    Image(systemName: "xmark")
                }
            }
            .padding(.trailing, 16)
        }
    }
}

