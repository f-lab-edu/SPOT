//
//  LocationView.swift
//
//
//  Created by 김민식 on 2024/02/02.
//

import SwiftUI
import TCAProxy
import ComposableArchitecture

public struct LocationView: View {
    let store: StoreOf<LocationCore>
    
    public init(store: StoreOf<LocationCore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }, send: { .view($0) }) {
            viewStore in
            Text("운동시간")
                .onAppear {
                    viewStore.send(.startButtonTapped)
                }
        }
    }
}
