//
//  TimerUsecase.swift
//
//
//  Created by 김민식 on 2024/02/14.
//

import Combine

public protocol TimerUsecase {
    var runningTime: PassthroughSubject<Int, Never> { get }
    
    func activate()
    func resume()
    func suspend()
}
