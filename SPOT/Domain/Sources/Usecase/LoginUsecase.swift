//
//  LoginUsecase.swift
//
//
//  Created by 김민식 on 2024/02/19.
//

import Foundation

public protocol LoginUsecase {
    func loginWithKakao(completion: @escaping (Bool) -> Void)
    func loginWithGoogle(completion: @escaping (Bool) -> Void)
}
