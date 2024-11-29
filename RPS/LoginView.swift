//
//  LoginView.swift
//  RPS
//
//  Created by Ray Huang on 2024/11/27.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginValid: Bool = false
    @State private var showContentView: Bool = false
    @State private var showRegisterView: Bool = false
    @State private var emailError: String? = nil
    @State private var passwordError: String? = nil
    @State private var viewOpacity: Double = 0.0
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("登入 / 註冊")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                if let emailError = emailError {
                    Text(emailError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.bottom, 5)
                }
                
                TextField("電子郵件", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.bottom, 20)
                    .onChange(of: email) {
                        validateLogin()
                    }
                
                if let passwordError = passwordError {
                    Text(passwordError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.bottom, 5)
                }
                
                SecureField("帳號密碼", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.bottom, 20)
                    .onChange(of: password) {
                        validateLogin()
                    }
                
                HStack {
                    Button(action: {
                        if isLoginValid {
                            showContentView = true
                        }
                    }) {
                        Text("登入")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(isLoginValid ? Color.black : Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(!isLoginValid)
                    
                    Button(action: {
                        if isLoginValid {
                            showRegisterView = true
                        }
                    }) {
                        Text("註冊")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(isLoginValid ? Color.black : Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(!isLoginValid)
                }
                .navigationDestination(isPresented: $showContentView) {
                    HallView()
                        .navigationBarBackButtonHidden(true)
                }
                .navigationDestination(isPresented: $showRegisterView) {
                    RegisterView(email: email, password: password)
                        .navigationBarBackButtonHidden(true)
                }
            }
            .padding()
            .opacity(viewOpacity)
            .onAppear {
                withAnimation(.easeIn(duration: 0.5)) {
                    viewOpacity = 1.0
                }
            }
        }
    }
    
    private func validateLogin() {
        let emailValid = email.contains("@") && email.contains(".")
        let passwordValid = password.count >= 8 && password.rangeOfCharacter(from: .decimalDigits) != nil && password.rangeOfCharacter(from: .letters) != nil
        
        isLoginValid = emailValid && passwordValid
        
        emailError = emailValid ? nil : "電子郵件無效"
        passwordError = passwordValid ? nil : "密碼應大於8個字元並且包含數字以及英文"
    }
}

#Preview {
    LoginView()
}
