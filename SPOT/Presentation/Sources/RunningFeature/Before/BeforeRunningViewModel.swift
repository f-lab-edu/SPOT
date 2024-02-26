//
//  BeforeRnningViewModel.swift
//
//
//  Created by 김민식 on 2024/02/05.
//

import Foundation

import Usecase

public class BeforeRnningViewModel: ObservableObject {
    private let authorizationUsecase: RunningAuthorizationUsecase
    
    public init(authorizationUsecase: RunningAuthorizationUsecase) {
        self.authorizationUsecase = authorizationUsecase
    }
    
    func requestAuthorization(completion: () -> Void) async {
        await authorizationUsecase.requestAuthorization()
        completion()
    }
}
