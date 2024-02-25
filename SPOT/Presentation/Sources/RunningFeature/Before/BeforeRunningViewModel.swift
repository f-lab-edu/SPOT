//
//  BeforeRnningViewModel.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation

import Usecase

public class BeforeRnningViewModel: ObservableObject {
    private let padUsecase: RunningPadUsecase
    private let timerUsecase: TimerUsecase
    private let currentDate: () -> Date
    
    public init(padUsecase: RunningPadUsecase, timerUsecase: TimerUsecase, currentDate: @escaping () -> Date) {
        self.padUsecase = padUsecase
        self.timerUsecase = timerUsecase
        self.currentDate = currentDate
    }
    
    func start(completion: () -> Void) {
        padUsecase.start(startedAt: self.currentDate())
        timerUsecase.activate()
        completion()
    }
}
