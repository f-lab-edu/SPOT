//
//  ContentView.swift
//  SPOT
//
//  Created by 만리자 on 1/13/24.
//

import SwiftUI

import RunningFeature
import AuthFeature

public struct ContentView: View {
    @StateObject private var viewModel: ContentViewModel
    @State private var isLoggingIn = false
    
    private let beforeRunningFactory: any Factory
    private let duringRunningFactory: any Factory
    private let pauseRunningFactory: any Factory
    private let stopRunningFactory: any Factory
    private let countdownFactory: any Factory
    private let loginFactory: any LoginFactory
    
    public init(
        viewModel: ContentViewModel,
        beforeRunningFactory: any Factory,
        duringRunningFactory: any Factory,
        pauseRunningFactory: any Factory,
        stopRunningFactory: any Factory,
        countdownFactory: any Factory,
        loginFactory: any LoginFactory) {
            _viewModel = StateObject(wrappedValue: viewModel)
            self.beforeRunningFactory = beforeRunningFactory
            self.duringRunningFactory = duringRunningFactory
            self.pauseRunningFactory = pauseRunningFactory
            self.stopRunningFactory = stopRunningFactory
            self.countdownFactory = countdownFactory
            self.loginFactory = loginFactory
        }
    
    public var body: some View {
        TabView {
            NavigationStack {
                RunningStatusView(
                    beforeRunningFactory: beforeRunningFactory,
                    duringRunningFactory: duringRunningFactory,
                    pauseRunningFactory: pauseRunningFactory,
                    stopRunningFactory: stopRunningFactory,
                    countdownFactory: countdownFactory
                )
            }
            .tabItem { Label("러닝", systemImage: "bolt") }
            
            NavigationStack {
                EmptyView()
            }
            .tabItem { Label("기록", systemImage: "list.bullet") }
            
            NavigationStack {
                EmptyView()
            }
            .tabItem { Label("마이", systemImage: "person") }
        }
        .onAppear {
            isLoggingIn = viewModel.needToLogin()
        }
        .fullScreenCover(isPresented: $isLoggingIn) {
            AnyView(loginFactory.make())
        }
    }
}
