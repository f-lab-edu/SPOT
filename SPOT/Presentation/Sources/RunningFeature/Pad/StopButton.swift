//
//  StopButton.swift
//
//
//  Created by 10004 on 2/14/24.
//

import SwiftUI

struct StopButton: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "stop.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.purple)
        }
    }
}
