//
//  LoginView.swift
//  RPS
//
//  Created by Ray Huang on 2024/11/27.
//

import SwiftUI

struct LoginView: View {
    @State private var nickname: String = ""
    @State private var password: String = ""
    @State private var isLoginValid: Bool = false
    @State private var showContentView: Bool = false
    @State private var nicknameError: String? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
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
                    .onChange(of: nickname) {
                        validateLogin()
                    }
                
                SecureField("帳號密碼", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.bottom, 20)
                    .onChange(of: password) {
                        validateLogin()
                    }
                
                Button(action: {
                    if isLoginValid {
                        showContentView = true
                    }
                }) {
                    Text("登入/註冊")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isLoginValid ? Color.black : Color.gray.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(!isLoginValid)
                .navigationDestination(isPresented: $showContentView) {
                    ContentView()
                        .navigationBarBackButtonHidden(true)
                }
            }
            .padding()
        }
    }
    
    private func validateLogin() {
        let nicknameValid = nickname.count <= 16
        let passwordValid = !password.isEmpty
        isLoginValid = nicknameValid && passwordValid
        
        if !nicknameValid {
            nicknameError = "帳號暱稱不得超過十六個字"
        } else {
            nicknameError = nil
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
