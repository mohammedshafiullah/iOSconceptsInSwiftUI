//
//  SettingsViewModel.swift
//  DependencyInjection
//
//  Created by mohammed Shafiullah on 21/10/25.
//

import Foundation
import Combine


class SettingsViewModel: ObservableObject {
    private let authService: AuthServiceProtocol
    @Published var lastRefreshTime: Date?

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    func refreshToken() {
        authService.refreshToken { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    self?.lastRefreshTime = Date()
                }
            }
        }
    }
}
