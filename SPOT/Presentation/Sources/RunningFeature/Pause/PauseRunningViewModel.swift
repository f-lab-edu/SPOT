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
    
    private var dashboardUsecase: RunningDashboardUsecase
    private var cancellables = Set<AnyCancellable>()
    
    public init(dashboardUsecase: RunningDashboardUsecase) {
        self.dashboardUsecase = dashboardUsecase
        
        dashboardUsecase.location
            .receive(on: DispatchQueue.main)
            .sink { location in
                self.locations.append(location)
            }
            .store(in: &cancellables)
    }
}
