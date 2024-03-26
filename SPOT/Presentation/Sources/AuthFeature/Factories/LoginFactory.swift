//
//  LoginFactory.swift
//
//
//  Created by 10004 on 2/20/24.
//

import SwiftUI

import Usecase

public protocol LoginFactory {
    associatedtype SomeView: View
    
    func make() -> SomeView
}

public struct LoginFactoryImp: LoginFactory {
    private let usecase: LoginUsecase
    
    public init(usecase: LoginUsecase) {
        self.usecase = usecase
    }
    
    public func make() -> LoginView {
        let viewModel = LoginViewModel(loginUsecase: usecase)
        
        return LoginView(viewModel: viewModel)
    }
}
