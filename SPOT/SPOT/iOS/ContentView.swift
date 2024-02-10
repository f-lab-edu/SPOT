//
//  ContentView.swift
//  SPOT
//
//  Created by 만리자 on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    private let compositionRoot = CompositionRoot()
    
    var body: some View {
        compositionRoot.RunningView
    }
}

#Preview {
    ContentView()
}
