//
//  ContentViewModel.swift
//
//
//  Created by 김민식 on 2024/03/19.
//

import Foundation

import Usecase

public final class ContentViewModel: ObservableObject {
    private let loginableUsecase: LoginableUsecase
    
    public init(loginableUsecase: LoginableUsecase) {
        self.loginableUsecase = loginableUsecase
    }
    
    public func needToLogin() -> Bool {
        return loginableUsecase.loginable()
    }
}
