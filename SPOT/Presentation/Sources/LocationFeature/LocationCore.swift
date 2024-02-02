//
//  LocationCore.swift
//
//
//  Created by 김민식 on 2024/02/01.
//

import Foundation
import TCAProxy
import ComposableArchitecture
import Running

@Reducer
public struct LocationCore {
    public struct State {
        private let usecase: LocationUsecaseProtocol
        
        public init(usecase: LocationUsecaseProtocol) {
            self.usecase = usecase
        }
    }
    
    public enum Action {}
    
    public init() {}
    
    public func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        
    }
}
