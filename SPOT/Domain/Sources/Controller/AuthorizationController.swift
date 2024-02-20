//
//  AuthorizationController.swift
//
//
//  Created by 김민식 on 2024/02/20.
//

import Entity

public protocol AuthorizationController {
    func login(completion: @escaping (LoginResult) -> Void) 
    func logout()
}
