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
    public struct State: Equatable {
        let usecase: LocationUsecase
        
        public init(usecase: LocationUsecase) {
            self.usecase = usecase
        }
        
        public static func == (lhs: LocationCore.State, rhs: LocationCore.State) -> Bool {
            false
        }
    }
    
    public enum Action {
        case view(View)
        
        public enum View {
            case onAppear
            case startButtonTapped
            case pauseButtonTapped
            case resumeButtonTapped
            case stopButtonTapped
        }
    }
    
    public init() {}
    
    private struct LocationServiceID: Hashable {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .view(.onAppear):
//                return .run { [usecase = state.usecase] send in
//                    let steam = usecase.delegate()
//                    
//                    for await action in steam {
//                        
//                    }
//                }
                return .none
                
            case .view(.startButtonTapped):
                print("흠흠흠")
                state.usecase.start()
                return .none
                
            case .view(.pauseButtonTapped):
                return .none
                
            case .view(.resumeButtonTapped):
                return .none
                
            case .view(.stopButtonTapped):
                return .none
            }
        }
    }
}
