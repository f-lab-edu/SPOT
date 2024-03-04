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
                .font(.system(size: 100, weight: .bold))
            
            Spacer()
            
            VStack(alignment: .center, spacing: 10) {
                Button {
                    
                } label: {
                    Text("카카오 로그인")
                        .frame(width: 50)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(8)
                        .foregroundColor(.yellow)
                }
                
                Button {
                    
                } label: {
                    Text("구글 로그인")
                        .frame(width: 50)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(8)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}
