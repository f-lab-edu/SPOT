//
//  AuthController.swift
//
//
//  Created by 김민식 on 2024/02/20.
//

import Entity

public protocol AuthController {
    func login() async -> User
    func logout()
}
