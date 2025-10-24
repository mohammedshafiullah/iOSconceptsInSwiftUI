//
//  ProfileViewModel.swift
//  DependencyInjection
//
//  Created by mohammed Shafiullah on 21/10/25.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    private let authService: AuthServiceProtocol
    @Published var user: User?

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    func loadProfile() {
        authService.fetchProfile { [weak self] user in
            DispatchQueue.main.async {
                self?.user = user
            }
        }
    }
}
