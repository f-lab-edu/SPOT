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
    private var cancellables = Set<AnyCancellable>()
    
    public init(streamUsecase: RunningStreamUsecase) {
        self.streamUsecase = streamUsecase
        
        streamUsecase.location
            .receive(on: DispatchQueue.main)
            .sink { location in
                self.locations.append(location)
            }
            .store(in: &cancellables)
    }
}
