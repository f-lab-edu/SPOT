//
//  ContentView.swift
//  SPOT
//
//  Created by 만리자 on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    private let runningFactory: any RunningFactory
    
    init(runningFactory: any RunningFactory) {
        self.runningFactory = runningFactory
    }
    
    var body: some View {
        runningFactory.makeBeforeRunning
    }
}
