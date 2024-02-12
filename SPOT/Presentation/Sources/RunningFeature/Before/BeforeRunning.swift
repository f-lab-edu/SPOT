//
//  BeforeRunning.swift
//
//
//  Created by 10004 on 2/10/24.
//

import SwiftUI

public struct BeforeRunning: View {
    private var viewModel: RunningLocationViewModel
    
    public init(viewModel: RunningLocationViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            GPSStatusView()
            
            Spacer()
            
            Text("추후 아이데이션")
                .font(.system(size: 40))
                .foregroundStyle(.gray)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                StartRunningButton()
                
                SettingButton()
            }
            .frame(height: 100)
        }
    }
}

// MARK: - GPS State
extension BeforeRunning {
    struct GPSStatusView: View {
        var body: some View {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 2) {
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.green)
                
                Text("gps")
            }
            .frame(height: 80)
        }
    }
}


//MARK: - Start Button
extension BeforeRunning {
    struct StartRunningButton: View {
        var body: some View {
            Button {
                
            } label: {
                Image(systemName: "arrowtriangle.right.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.black)
            }
        }
    }
}

//MARK: - Start Button
extension BeforeRunning {
    struct SettingButton: View {
        var body: some View {
            Button {
                
            } label: {
                Image(systemName: "gearshape.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.gray)

            }
        }
    }
}
