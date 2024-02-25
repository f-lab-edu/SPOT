//
//  BeforeRunning.swift
//
//
//  Created by 10004 on 2/10/24.
//

import SwiftUI

public struct BeforeRunning: View {
    @EnvironmentObject private var status: RunningStatus
    
    private var viewModel: BeforeRnningViewModel
    
    public init(viewModel: BeforeRnningViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            GPSStatus()
            
            Spacer()
            
            Text("추후 아이데이션")
                .font(.system(size: 40))
                .foregroundStyle(.gray)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                StartButton(status: status, viewModel: viewModel)
                
                SettingButton()
            }
            .frame(height: 100)
        }
    }
}
