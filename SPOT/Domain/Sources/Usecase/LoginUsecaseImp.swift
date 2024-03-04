//
//  AuthUsecaseImp.swift
//
//
//  Created by 김민식 on 2024/02/19.
//

import Foundation

import Controller
import Entity

public final class LoginUsecaseImp: LoginUsecase {
    private let kakaoAuthController: AuthorizationController
    private let googleAuthController:AuthorizationController
    
    public init(kakaoAuthController: AuthorizationController, googleAuthController: AuthorizationController) {
        self.kakaoAuthController = kakaoAuthController
        self.googleAuthController = googleAuthController
    }
    
    public func loginWithKakao() {
        kakaoAuthController.login { result in
            
        }
    }
    
    public func loginWithGoogle() {
        googleAuthController.login { result in
            
        }
    }
}
