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
        Text("Location")
    }
}
