//
//  TimerUsecaseSpy.swift
//
//
//  Created by 10004 on 3/11/24.
//

import Combine
import Foundation

import Usecase

final class TimerUsecaseSpy: TimerUsecase {
    typealias RunningTimeMessage = PassthroughSubject<Int, Never>
    
    var runningTimeMessages: [RunningTimeMessage] = []
    var activateCallCount: Int = 0
    var resumeCallCount: Int = 0
    var suspendCallCount: Int = 0
    
    var runningTime: PassthroughSubject<Int, Never> = .init() {
        didSet {
            runningTimeMessages.append(runningTime)
        }
    }
    
    func activate() {
        activateCallCount += 1
    }
    
    func resume() {
        resumeCallCount += 1
    }
    
    func suspend() {
        suspendCallCount += 1
    }
}
