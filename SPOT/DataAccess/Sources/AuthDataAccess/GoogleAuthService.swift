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
    private let gidSignIn: GIDSignIn.Type
    private let presentingViewController: UIViewController
    
    public init(signInConfig: GIDConfiguration, gidSignIn: GIDSignIn.Type, presentingViewController: UIViewController) {
        self.signInConfig = signInConfig
        self.gidSignIn = gidSignIn
        self.presentingViewController = presentingViewController
    }
    
    public func login(completion: @escaping (LoginResult) -> Void) {
        gidSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { [weak self] result, error in
            guard let name = result?.user.profile?.name else { return }
            guard let thumbnailURL = result?.user.profile?.imageURL(withDimension: 70) else { return }
            
            let runner = Runner(name: name, thumbnailURL: thumbnailURL)
            completion(.success(runner))
        }
    }
    
    public func logout() {}
}
