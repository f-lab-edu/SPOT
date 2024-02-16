//
//  MapButton.swift
//
//
//  Created by 김민식 on 2024/02/15.
//

import SwiftUI

public struct MapButton: View {
    
    public var body: some View {
        Button {
            
        } label: {
            Image(systemName: "map.circle.fill")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(.gray)

        }
    }
}
