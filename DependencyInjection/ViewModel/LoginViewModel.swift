//
//  LoginViewModel.swift
//  DependencyInjection
//
//  Created by mohammed Shafiullah on 21/10/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    private let authService: AuthServiceProtocol
    @Published var isLoggedIn = false
    @Published var errorMessage: String?

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    func login(username: String, password: String) {
        authService.authenticate(username: username, password: password) { [weak self] success in
            DispatchQueue.main.async {
                if success {
                    self?.isLoggedIn = true
                } else {
                    self?.errorMessage = "Invalid credentials"
                }
            }
        }
    }
}
