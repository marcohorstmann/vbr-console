//
//  LoginView.swift
//  VBR Console
//
//  Created by Marco Horstmann on 28.02.24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginVM: LoginViewModel
    
    var body: some View {
        VStack {
            Spacer()
            LoginImage()
            Text("This is a private project.")
                .font(.caption)
            Text("Not supported by Veeam")
                .font(.caption)
            Text("Check https://github.com/marcohorstmann/vbrconsole")
                .font(.caption)
            Spacer()
            LoginInput(loginVM: loginVM)
                .frame(maxWidth: 300)
            Spacer()
        }
    }
}

private struct LoginInput: View {
    @ObservedObject var loginVM: LoginViewModel
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            //LoginImage()
            UsernameTextField(username: $loginVM.username)
            PasswordTextField(password: $loginVM.password)
            //
            if loginVM.hasError {
                ErrorBoxView(error: loginVM.error)
            //ErrorBoxView()
            }
            HStack {
                /* if loginVM.hasBiometricAuthenticationAvailable {
                    Button(action: {
                        let result = loginVM.biometricLogin()
                        appState.isLoggedId = error == .none
                    }) {
                        LoginText()
                    }
                } */
                Spacer()
                Button(action: {
                    let result = loginVM.login()
                    appState.isLoggedId = result.error == .none
                    appState.jwt = result.jwt
                }) {
                    LoginText()
                }
            }
            .padding()
        }
        .neumorphismStyle()
    }
}

private struct LoginText: View {
    var body: some View {
    Text("Anmelden")
            .font(.headline)
            .foregroundColor(.white)
            .padding(10)
            .background(.green)
            .cornerRadius(15)
        
    }
    
}

private struct BiometricButtonView: View {
    var biometricType: BiometricType
    
    var body: some View {
        HStack {
            Image(systemName: biometricType.getIconName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(biometricType.getText)
        }
    }
}

private struct LoginImage: View {
    var body: some View {
        Image("veeamlogo")
            .resizable()
            .scaledToFit()
            .frame(width: 250 )
            .padding()
    }
}

private struct UsernameTextField: View {
    @Binding var username: String
    
    var body: some View {
        HStack {
            //Text("Username")
            Image(systemName: "person")
            TextField("Benutzername", text: $username)
                .padding(.leading, 10)
            
        }
        .padding()
        .padding(.horizontal)
    }
}

private struct PasswordTextField: View {
    @Binding var password: String
    
    var body: some View {
        HStack {
            //Text("Username")
            Image(systemName: "lock")
            SecureField("Passwort", text: $password)
                .padding(.leading, 10)
            
        }
        .padding()
        .padding(.horizontal)
    }
}

private struct ErrorBoxView: View {
    
    var error = LoginError.invalidpassword
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle.fill")
            Text(error.description)
        }
        .foregroundColor(.red)
    }
}

#Preview {
    LoginView(loginVM: LoginViewModel(loginHandler: LoginHandlerMock()))
}
