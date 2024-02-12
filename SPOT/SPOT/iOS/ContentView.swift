//
//  ContentView.swift
//  SPOT
//
//  Created by 만리자 on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    private let compositionRoot = CompositionRoot()
    private let runningFactory: some RunningFactory = RunningFactoryImp()
    
    var body: some View {
        runningFactory.makeBeforeRunning(compositionRoot.runningLocationViewModel)
    }
}

#Preview {
    ContentView()
}
