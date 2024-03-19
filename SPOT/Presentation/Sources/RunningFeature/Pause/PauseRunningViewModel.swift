//
//  PauseRunningViewModel.swift
//
//
//  Created by 10004 on 2/18/24.
//

import Combine
import Foundation

import Usecase
import Entity

public final class PauseRunningViewModel: ObservableObject {
    @Published var locations: [Location] = []
    
    private var streamUsecase: RunningStreamUsecase
    private var controlUsecase: RunningControlUsecase
    private let timerUsecase: TimerUsecase
    private var cancellables = Set<AnyCancellable>()
    
    public init(streamUsecase: RunningStreamUsecase, controlUsecase: RunningControlUsecase, timerUsecase: TimerUsecase) {
        self.streamUsecase = streamUsecase
        self.controlUsecase = controlUsecase
        self.timerUsecase = timerUsecase
        
        streamUsecase.location
            .receive(on: DispatchQueue.main)
            .sink { location in
                self.locations.append(location)
            }
            .store(in: &cancellables)
    }
    
    public func resume(completion: () -> Void) {
        controlUsecase.resume()
        timerUsecase.resume()
        completion()
    }
    
    public func stop(completion: () -> Void) {
        controlUsecase.stop()
        timerUsecase.stop()
        completion()
    }
}
