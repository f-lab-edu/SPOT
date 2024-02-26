//
//  BeforeRnningViewModel.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Combine

import Usecase

public class BeforeRnningViewModel: ObservableObject {
    @Published var isLocationAuthorized = false
    @Published var isActivityAuthorized = false
    
    private let authorizationUsecase: RunningAuthorizationUsecase
    private var cancellables = Set<AnyCancellable>()
    
    public init(authorizationUsecase: RunningAuthorizationUsecase) {
        self.authorizationUsecase = authorizationUsecase
        
        authorizationUsecase.locationAuthorizationStatus
            .sink { status in
                self.isLocationAuthorized = status == .always || status == .whenInUse
            }
            .store(in: &cancellables)
        
        authorizationUsecase.activityAuthorizationStatus
            .sink { status in
                self.isActivityAuthorized = status == .authorized
            }
            .store(in: &cancellables)
    }
    
    func requestAuthorization() async {
        await authorizationUsecase.requestAuthorization()
    }
}
