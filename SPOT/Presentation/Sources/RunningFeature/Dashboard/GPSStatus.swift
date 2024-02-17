//
//  GPSStatus.swift
//
//
//  Created by 김민식 on 2024/02/16.
//

import SwiftUI

struct GPSStatus: View {
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
