//
//  RunningStatusViewModel.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation

import Usecase

public final class RunningStatusViewModel: ObservableObject {
    @Published var uiState: RunningState = .before
    
    private let locationUsecase: LocationUsecase
    
    public init(locationUsecase: LocationUsecase) {
        self.locationUsecase = locationUsecase
    }
    
    func startRunningButtonTapped() {
        locationUsecase.startRunning()
    }
}

enum RunningState {
    case before
    case startCountdown
    case run
    case pause
    case stop
}
