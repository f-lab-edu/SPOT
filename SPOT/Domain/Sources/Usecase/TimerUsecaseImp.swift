//
//  TimerUsecaseImp.swift
//
//
//  Created by 김민식 on 2024/02/14.
//

import Combine
import Foundation

public final class TimerUsecaseImp: TimerUsecase {
    private enum State {
        case suspended
        case resumed
    }
    
    private var state: State = .suspended
    private let timerLock = NSLock()
    private let interval: Int = 1
    private var time: Int = 0
    public var runningTime = PassthroughSubject<Int, Never>()
    
    public init() {}
    
    private lazy var timer: DispatchSourceTimer = {
        let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        timer.schedule(deadline: .now(), repeating: .seconds(self.interval))
        timer.setEventHandler {
            self.time += self.interval
            self.runningTime.send(self.time)
        }
        
        return timer
    }()
    
    public func activate() {
        timerLock.lock()
        timer.activate()
        state = .resumed
        timerLock.unlock()
    }
    
    public func resume() {
        timerLock.lock()
        if state == .resumed {
            timerLock.unlock()
            return
        }
        state = .resumed
        timer.resume()
        timerLock.unlock()
    }
    
    public func suspend() {
        timerLock.lock()
        if state == .suspended {
            timerLock.unlock()
            return
        }
        state = .suspended
        timer.suspend()
        timerLock.unlock()
    }
    
    public func stop() {
        timerLock.lock()
        timer.cancel()
        time = 0
        timerLock.unlock()
    }
}
