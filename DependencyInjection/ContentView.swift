//
//  ContentView.swift
//  DependencyInjection
//
//  Created by mohammed Shafiullah on 21/10/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var loginVM = LoginViewModel(authService: APIAuthService())
    @StateObject private var profileVM = ProfileViewModel(authService: APIAuthService())
    @StateObject private var settingsVM = SettingsViewModel(authService: APIAuthService())

    @State private var username = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("🔐 Dependency Injection Example")
                    .font(.title)
                    .bold()

                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("UsernameTextField")
                    .padding(.horizontal)

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("PasswordSecureField")
                    .padding(.horizontal)

                Button("Login") {
                    loginVM.login(username: username, password: password)
                }
                .accessibilityIdentifier("LoginButton")
                .buttonStyle(.borderedProminent)

                if let error = loginVM.errorMessage {
                    Text(error).foregroundColor(.red)
                }

                if loginVM.isLoggedIn {
                    Text("✅ Login successful")
                    .accessibilityIdentifier("LoginSuccessLabel")

                    Divider()
                    Button("Load Profile") {
                        profileVM.loadProfile()
                    }
                    .buttonStyle(.bordered)
                   

                    if let user = profileVM.user {
                        Text("👤 \(user.name)\n📧 \(user.email)")
                            .multilineTextAlignment(.center)
                    }

                    Divider()
                    Button("Refresh Token") {
                        settingsVM.refreshToken()
                    }

                    if let time = settingsVM.lastRefreshTime {
                        Text("Last Refreshed: \(time.formatted())")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                }
                else if let error = loginVM.errorMessage {
                                Text("❌ \(error)")
                                    .foregroundColor(.red)
                                    .accessibilityIdentifier("LoginErrorLabel")
                            }

                Spacer()
            }
            .padding()
        }
    }
}
