//
//  CountdownView.swift
//
//
//  Created by 10004 on 2/14/24.
//

import SwiftUI

struct CountdownView: View {
    @Environment(\.dismiss) var dismiss
    @State private var timeRemaining = 5
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("건너뛰기")
                        .font(.title3)
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
            
            Text("5")
                .font(.title)
            
            Spacer()
        }
        .onReceive(timer) { time in
            if timeRemaining < 0 {
                timeRemaining -= 1
            }
        }
    }
}
