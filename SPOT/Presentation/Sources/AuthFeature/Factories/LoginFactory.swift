//
//  LoginFactory.swift
//
//
//  Created by 10004 on 2/20/24.
//

import SwiftUI

public protocol LoginFactory {
    associatedtype SomeView: View
    
    func make() -> SomeView
}

public struct LoginFactoryImp: LoginFactory {
    let viewModel: LoginViewModel
    
    public init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    public func make() -> LoginView {
        LoginView(viewModel: viewModel)
    }
}
