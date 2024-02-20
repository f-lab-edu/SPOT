//
//  GoogleAuthService.swift
//
//
//  Created by 김민식 on 2024/02/20.
//

import Controller
import Entity
import GoogleSignIn

public final class GoogleAuthService: AuthorizationController {
    private let signInConfig: GIDConfiguration
    private let presentingViewController: UIViewController
    
    public init(signInConfig: GIDConfiguration, presentingViewController: UIViewController) {
        self.signInConfig = signInConfig
        self.presentingViewController = presentingViewController
    }
    
    public func login(completion: @escaping (LoginResult) -> Void) {
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
            guard let name = result?.user.profile?.name else { return }
            guard let thumbnailURL = result?.user.profile?.imageURL(withDimension: 70) else { return }
            
            let runner = Runner(name: name, thumbnailURL: thumbnailURL)
            completion(.success(runner))
        }
    }
    
    public func logout() {}
}
