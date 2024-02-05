//
//  RunningStatusViewModel.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation

public final class RunningStatusViewModel: ObservableObject {
    @Published var uiState: RunningState = .before
    
    public init() {}
}

enum RunningState {
    case before
    case startCountdown
    case run
    case pause
    case stop
}
