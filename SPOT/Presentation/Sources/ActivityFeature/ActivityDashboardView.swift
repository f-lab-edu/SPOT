//
//  ActivityDashboardView.swift
//
//
//  Created by 김민식 on 2024/02/14.
//

import SwiftUI

public struct ActivityDashboardView: View {
    private var viewModel: ActivityDashBoardViewModel
    
    public init(viewModel: ActivityDashBoardViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 40) {
            VStack(alignment: .center, spacing: 16) {
                HStack(alignment: .bottom) {
                    Text(viewModel.distance)
                        .font(.title)
                    
                    Text("km")
                }
                
                Text("전체 거리")
            }
            
            HStack(alignment: .center) {
                VStack(alignment: .center, spacing: 16) {
                    Text("1:23:31")
                    
                    Text("시간")
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 16) {
                    Text(viewModel.pace)
                    
                    Text("현재 페이스")
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 16) {
                    Text(viewModel.pace)
                    
                    Text("소모 칼로리")
                }
            }
            .padding(.horizontal, 40)
        }
    }
}
