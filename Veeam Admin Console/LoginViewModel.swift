//
//  LoginViewModel.swift
//  VBR Console
//
//  Created by Marco Horstmann on 28.02.24.
//

import Foundation
//import SwiftKeychainWrapper

class LoginViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    @Published var error = LoginError.none
    private var knownUser = false
    
    private var loginHandler: LoginHandler
    //private var biometricAuthentication = BiometricAuthentication()
    
    var hasError: Bool {
        get {
            return error != .none
        }
    }
    
    var hasBiometricAuthenticationAvailable: Bool {
        get {
            return knownUser
        }
    }
}
    
 
    
    init(loginHandler: LoginHandler) {
        self.loginHandler = loginHandler
        username = "Marco"
        knownUser = username != ""
    }
    
    func login() -> LoginResult {
        let result = loginHandler.login(username: username, password: password)
        return result
    }
    
    func biometricLogin() -> LoginResult {
            return login()
}
