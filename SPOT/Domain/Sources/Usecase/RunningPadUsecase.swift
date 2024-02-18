//
//  RunningPadUsecase.swift
//
//
//  Created by 10004 on 2/18/24.
//

import Foundation

public protocol RunningPadUsecase {
    func start(startedAt: Date)
    func resume(startedAt: Date)
    func pause()
    func stop()
}
