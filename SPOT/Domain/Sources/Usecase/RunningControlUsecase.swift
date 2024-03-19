//
//  RunningControlUsecase.swift
//
//
//  Created by 10004 on 2/18/24.
//

import Foundation

public protocol RunningControlUsecase {
    func start(startedAt: Date)
    func resume()
    func pause()
    func stop()
}
