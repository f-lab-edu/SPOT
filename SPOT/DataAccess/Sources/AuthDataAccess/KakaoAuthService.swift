//
//  KakaoAuthService.swift
//
//
//  Created by 김민식 on 2024/02/20.
//

import Foundation

import Controller
import Entity
import KakaoSDKAuth
import KakaoSDKUser

public final class KakaoAuthService: AuthorizationController {
    private let userAPI: UserApi.Type
    
    public init(userAPI: UserApi.Type) {
        self.userAPI = userAPI
    }
    
    public enum Error: Swift.Error {
        case notAvailable
    }
    
    public func login(completion: @escaping (LoginResult) -> Void) {
        guard userAPI.isKakaoTalkLoginAvailable() else {
            completion(.failure(Error.notAvailable))
            return
        }
        
        userAPI.shared.loginWithKakaoTalk { token, error in
            if let error = error {
                completion(.failure(error))
            }
        }
        
        userAPI.shared.me { user, error in
            guard let name = user?.kakaoAccount?.name else { return }
            guard let thumbnailURL = user?.kakaoAccount?.profile?.thumbnailImageUrl else { return }
            let runner = Runner(name: name, thumbnailURL: thumbnailURL)
            
            completion(.success(runner))
        }
    }
    
    public func logout() {
        
    }
}
