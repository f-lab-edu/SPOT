//
//  DuringRunningViewModel.swift
//
//
//  Created by 김민식 on 2024/02/22.
//

import Foundation

import Usecase

public final class DuringRunningViewModel: ObservableObject {
    private let padUsecase: RunningPadUsecase
    private let timerUsecase: TimerUsecase
    
    public init(padUsecase: RunningPadUsecase, timerUsecase: TimerUsecase) {
        self.padUsecase = padUsecase
        self.timerUsecase = timerUsecase
    }
    
    func pause(completion: () -> Void) {
        padUsecase.pause()
        timerUsecase.suspend()
        completion()
    }
    
    func stop(completion: () -> Void) {
        padUsecase.stop()
        completion()
    }
}
