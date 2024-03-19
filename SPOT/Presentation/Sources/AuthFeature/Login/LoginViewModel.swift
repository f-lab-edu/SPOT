//
//  LoginViewModel.swift
//
//
//  Created by 김민식 on 2024/02/19.
//

import Foundation

import Usecase

public final class LoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    private let loginUsecase: LoginUsecase
    
    public init(loginUsecase: LoginUsecase) {
        self.loginUsecase = loginUsecase
    }
    
    func kakaoLoginButtonTapped() {
        loginUsecase.loginWithKakao { isLoggedIn in
            self.isLoggedIn = isLoggedIn
        }
    }
    
    func googleLoginButtonTapped() {
        loginUsecase.loginWithGoogle { isLoggedIn in
            self.isLoggedIn = isLoggedIn
        }
    }
}
