//
//  SPOTApp.swift
//  SPOT
//
//  Created by 만리자 on 1/13/24.
//

import SwiftUI

import Root

@main
struct SPOTApp: App {
    private let compositionRoot = CompositionRoot()
    
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: compositionRoot.contentViewModel,
                beforeRunningFactory: compositionRoot.beforeRunningFactory,
                duringRunningFactory: compositionRoot.duringRunningFactory,
                pauseRunningFactory: compositionRoot.pauseRunningFactory,
                stopRunningFactory: compositionRoot.stopRunningFactory, 
                countdownFactory: compositionRoot.countdownFactory,
                loginFactory: compositionRoot.loginFactory
            )
            .onOpenURL { url in
                compositionRoot.validateURL(url)
            }
        }
    }
}
