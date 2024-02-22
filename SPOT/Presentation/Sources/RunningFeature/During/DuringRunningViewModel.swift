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
    
    public init(padUsecase: RunningPadUsecase) {
        self.padUsecase = padUsecase
    }
    
    func pause(completion: () -> Void) {
        padUsecase.pause()
        completion()
    }
}
