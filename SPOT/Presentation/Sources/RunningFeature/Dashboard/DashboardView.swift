//
//  DashboardView.swift
//
//
//  Created by 김민식 on 2024/02/14.
//

import SwiftUI

public struct DashboardView: View {
    @StateObject private var viewModel: DashboardViewModel
    
    public init(viewModel: DashboardViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .center, spacing: 5) {
                Text("\(viewModel.runningTime)")
                    .font(.system(size: 30, weight: .bold))
                
                Text("시간")
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
            }
            
            VStack(alignment: .center, spacing: 30) {
                VStack(alignment: .center, spacing: 5) {
                    HStack(alignment: .bottom) {
                        Text(viewModel.distance)
                            .frame(width: 100)
                            .font(.system(size: 60, weight: .bold))
                        
                        Text("km")
                            .font(.system(size: 20, weight: .bold))
                    }
                    
                    Text("전체 거리")
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                }
                
                VStack(alignment: .center, spacing: 5) {
                    Text(viewModel.pace)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("현재 페이스")
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                }
            }
            
            VStack(alignment: .center, spacing: 5) {
                Text(viewModel.pace)
                    .font(.system(size: 30, weight: .bold))
                
                Text("소모 칼로리")
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal, 40)
    }
}
