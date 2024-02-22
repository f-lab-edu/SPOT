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
    private let currentDate: () -> Date
    
    public init(padUsecase: RunningPadUsecase, currentDate: @escaping () -> Date) {
        self.padUsecase = padUsecase
        self.currentDate = currentDate
    }
    
    func start() {
        padUsecase.start(startedAt: self.currentDate())
    }
}
