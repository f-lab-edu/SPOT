//
//  AuthUsecaseImp.swift
//
//
//  Created by 김민식 on 2024/02/19.
//

import Foundation

import Controller
import Entity

public final class AuthUsecaseImp: LoginUsecase, LogoutUsecase, LoginableUsecase {
    private let kakaoAuthController: AuthorizationController
    private let googleAuthController: AuthorizationController
    private let persistanceController: PersistanceController
    
    private static let RunnerSaveKey = "RecordSaveKey"
    
    public init(kakaoAuthController: AuthorizationController,
                googleAuthController: AuthorizationController,
                persistanceController: PersistanceController) {
        self.kakaoAuthController = kakaoAuthController
        self.googleAuthController = googleAuthController
        self.persistanceController = persistanceController
    }
    
    public func loginWithKakao(completion: @escaping (Bool) -> Void) {
        kakaoAuthController.login { result in
            switch result {
            case .success(let runner):
                self.persistanceController.save(model: runner, with: AuthUsecaseImp.RunnerSaveKey)
                completion(true)
                
            case .failure(let _): break
            }
        }
    }
    
    public func loginWithGoogle(completion: @escaping (Bool) -> Void) {
        googleAuthController.login { result in
            switch result {
            case .success(let runner):
                self.persistanceController.save(model: runner, with: AuthUsecaseImp.RunnerSaveKey)
                completion(true)
                
            case .failure(let _): break
            }
        }
    }
    
    public func logout() -> Bool {
        persistanceController.remove(with: AuthUsecaseImp.RunnerSaveKey)
        return true
    }

    public func loginable() -> Bool {
        return persistanceController.load(key: AuthUsecaseImp.RunnerSaveKey, type: Runner.self) == nil ? true : false
    }
}
