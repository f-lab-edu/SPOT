//
//  LoginViewModel.swift
//
//
//  Created by 김민식 on 2024/02/19.
//

import Foundation

import Usecase

public final class LoginViewModel: ObservableObject {
    private let loginUsecase: LoginUsecase
    
    public init(loginUsecase: LoginUsecase) {
        self.loginUsecase = loginUsecase
    }
    
    func kakaoLoginButtonTapped() {
        loginUsecase.loginWithKakao()
    }
    
    func googleLoginButtonTapped() {
        loginUsecase.loginWithGoogle()
    }
}
