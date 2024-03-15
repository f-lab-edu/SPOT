//
//  CountdownViewModel.swift
//  
//
//  Created by 10004 on 2/26/24.
//

import Foundation

import Usecase

public class CountdownViewModel: ObservableObject {
    private let controlUsecase: RunningControlUsecase
    private let timerUsecase: TimerUsecase
    private let currentDate: () -> Date
    
    public init(controlUsecase: RunningControlUsecase, timerUsecase: TimerUsecase, currentDate: @escaping () -> Date) {
        self.controlUsecase = controlUsecase
        self.timerUsecase = timerUsecase
        self.currentDate = currentDate
    }
    
    func start(completion: () -> Void) {
        controlUsecase.start(startedAt: self.currentDate())
        timerUsecase.activate()
        completion()
    }
}
