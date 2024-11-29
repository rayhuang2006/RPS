//
//  RegisterView.swift
//  RPS
//
//  Created by Ray Huang on 2024/11/29.
//

import SwiftUI

struct RegisterView: View {
    @State private var nickname: String = ""
    @State private var confirmPassword: String = ""
    @State private var showContentView: Bool = false
    @State private var showLoginView: Bool = false
    @State private var nicknameError: String? = nil
    @State private var confirmPasswordError: String? = nil
    let email: String
    let password: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("註冊")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                if let nicknameError = nicknameError {
                    Text(nicknameError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.bottom, 5)
                }
                
                TextField("帳號暱稱", text: $nickname)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.bottom, 20)
                
                if let confirmPasswordError = confirmPasswordError {
                    Text(confirmPasswordError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.bottom, 5)
                }
                
                SecureField("再次輸入密碼", text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.bottom, 20)
                
                Button(action: {
                    if confirmPassword == password {
                        showContentView = true
                    } else {
                        showLoginView = true
                    }
                }) {
                    Text("註冊")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $showContentView) {
                    HallView()
                        .navigationBarBackButtonHidden(true)
                }
                .navigationDestination(isPresented: $showLoginView) {
                    LoginView()
                        .navigationBarBackButtonHidden(true)
                }
            }
            .padding()
        }
    }
}

#Preview {
    RegisterView(email: "", password: "")
}