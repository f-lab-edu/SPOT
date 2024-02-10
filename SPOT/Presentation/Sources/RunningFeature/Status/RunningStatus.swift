//
//  RunningStatus.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation

public final class RunningStatus: ObservableObject {
    @Published var uiState: UIState = .before
    
    public init() {}
    
    enum UIState {
        case before
        case startCountdown
        case run
        case pause
        case stop
    }
}
