//
//  SPOTApp.swift
//  SPOT
//
//  Created by 만리자 on 1/13/24.
//

import SwiftUI

@main
struct SPOTApp: App {
    private let compositionRoot = CompositionRoot()
    
    var body: some Scene {
        WindowGroup {
            ContentView(runningFactory: compositionRoot.runningFactory)
        }
    }
}
