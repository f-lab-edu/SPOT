//
//  CountdownViewModel.swift
//  
//
//  Created by 10004 on 2/26/24.
//

import Foundation

import Usecase

public class CountdownViewModel: ObservableObject {
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
