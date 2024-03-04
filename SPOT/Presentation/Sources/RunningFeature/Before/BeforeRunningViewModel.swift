//
//  BeforeRnningViewModel.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Combine
import Foundation

import Usecase

public class BeforeRnningViewModel: ObservableObject {
    @Published var isCountdown = false
    
    private let authorizationUsecase: RunningAuthorizationUsecase
    private var cancellables = Set<AnyCancellable>()
    
    public init(authorizationUsecase: RunningAuthorizationUsecase) {
        self.authorizationUsecase = authorizationUsecase
        
        authorizationUsecase.activityAuthorizationStatus
            .receive(on: DispatchQueue.main)
            .sink { status in
                let isAuthorizedLocation = authorizationUsecase.isAuthorizedLocation()
                let isAuthorizedActivity = status
                
                self.isCountdown = isAuthorizedActivity && isAuthorizedLocation
            }
            .store(in: &cancellables)
        
        authorizationUsecase.locationAuthorizationStatus
            .receive(on: DispatchQueue.main)
            .sink { status in
                let isAuthorizedLocation = status == .always || status == .whenInUse
                let isAuthorizedActivity = authorizationUsecase.isAuthorizedActivity()
                
                self.isCountdown = isAuthorizedActivity && isAuthorizedLocation
            }
            .store(in: &cancellables)
    }
    
    private func isAuthorized() -> Bool {
        authorizationUsecase.isAuthorizedLocation() && authorizationUsecase.isAuthorizedActivity()
    }
    
    @MainActor
    func requestAuthorization() async {
        guard isAuthorized() else {
            await authorizationUsecase.requestAuthorization()
            return
        }
        
        isCountdown = true
    }
}
