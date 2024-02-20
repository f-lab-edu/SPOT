//
//  LoginViewModel.swift
//
//
//  Created by 김민식 on 2024/02/19.
//

import Foundation

import Usecase

public final class LoginViewModel: ObservableObject {
    private let authUsecase: AuthUsecase
    
    public init(authUsecase: AuthUsecase) {
        self.authUsecase = authUsecase
    }
    
    func kakaoLoginButtonTapped() {
        authUsecase.loginWithKakao()
    }
    
    func googleLoginButtonTapped() {
        authUsecase.loginWithGoogle()
    }
}
