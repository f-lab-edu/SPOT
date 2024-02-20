//
//  LoginView.swift
//
//
//  Created by 김민식 on 2024/02/19.
//

import SwiftUI

public struct LoginView: View {
    private let viewModel: LoginViewModel
    
    public init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Text("SPOT")
                .font(.system(size: 60, weight: .bold))
            
            Spacer()
            
            VStack(alignment: .center, spacing: 10) {
                Button {
                    viewModel.kakaoLoginButtonTapped()
                } label: {
                    Text("카카오 로그인")
                        .frame(width: 100, height: 45)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.yellow)
                        .cornerRadius(8)
                        .bold()
                }
                
                Button {
                    viewModel.googleLoginButtonTapped()
                } label: {
                    Text("구글 로그인")
                        .frame(width: 100, height: 45)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(8)
                        .bold()
                }
            }
        }
        .padding()
    }
}
