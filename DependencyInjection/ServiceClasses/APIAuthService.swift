//
//  AuthServiceProtocol.swift
//  DependencyInjection
//
//  Created by mohammed Shafiullah on 21/10/25.
//

import Foundation

protocol AuthServiceProtocol {
    func authenticate(username: String, password: String, completion: @escaping (Bool) -> Void)
    func fetchProfile(completion: @escaping (User?) -> Void)
    func refreshToken(completion: @escaping (Bool) -> Void)
}

class APIAuthService: AuthServiceProtocol {
    func authenticate(username: String, password: String, completion: @escaping (Bool) -> Void) {
           print("🔐 Authenticating user \(username)...")
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               let success = username == "admin" && password == "1234"
               completion(success)
           }
       }
       
       func fetchProfile(completion: @escaping (User?) -> Void) {
           print("📄 Fetching user profile...")
           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               let user = User(name: "John Doe", email: "john@doe.com")
               completion(user)
           }
       }
       
       func refreshToken(completion: @escaping (Bool) -> Void) {
           print("♻️ Refreshing token...")
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
               completion(true)
           }
       }
    
}
