//
//  DuringRunningViewModel.swift
//
//
//  Created by 김민식 on 2024/02/22.
//

import Foundation

import Usecase

public final class DuringRunningViewModel: ObservableObject {
    private let controlUsecase: RunningControlUsecase
    private let timerUsecase: TimerUsecase
    
    public init(controlUsecase: RunningControlUsecase, timerUsecase: TimerUsecase) {
        self.controlUsecase = controlUsecase
        self.timerUsecase = timerUsecase
    }
    
    func pause(completion: () -> Void) {
        controlUsecase.pause()
        timerUsecase.suspend()
        completion()
    }
    
    func stop(completion: () -> Void) {
        controlUsecase.stop()
        completion()
    }
}
