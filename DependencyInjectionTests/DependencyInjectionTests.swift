//
//  DependencyInjectionTests.swift
//  DependencyInjectionTests
//
//  Created by mohammed Shafiullah on 21/10/25.
//

import XCTest
@testable import DependencyInjection

final class DependencyInjectionTests: XCTestCase {
    
    
    class MockAuthService :AuthServiceProtocol {
        func authenticate(username: String, password: String, completion: @escaping (Bool) -> Void) {
            completion(username == "test" && password == "pass")
            
        }
        
        func fetchProfile(completion: @escaping (User?) -> Void) {
            completion(User(name: "Test User", email: "test@user.com"))
        }
        
        func refreshToken(completion: @escaping (Bool) -> Void) {
            completion(true)
        }
    }
        func testLoginSuccess() {
                let mockService = MockAuthService()
                let viewModel = LoginViewModel(authService: mockService)
                
                let expectation = XCTestExpectation(description: "Login")
                viewModel.login(username: "test", password: "pass")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    XCTAssertTrue(viewModel.isLoggedIn)
                    expectation.fulfill()
                }
                wait(for: [expectation], timeout: 1)
            }
            
            func testFetchProfile() {
                let mockService = MockAuthService()
                let profileVM = ProfileViewModel(authService: mockService)
                let expectation = XCTestExpectation(description: "Profile")
                
                profileVM.loadProfile()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    XCTAssertEqual(profileVM.user?.name, "Test User")
                    expectation.fulfill()
                }
                wait(for: [expectation], timeout: 1)
            }
            
            func testRefreshToken() {
                let mockService = MockAuthService()
                let settingsVM = SettingsViewModel(authService: mockService)
                let expectation = XCTestExpectation(description: "Token")
                
                settingsVM.refreshToken()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    XCTAssertNotNil(settingsVM.lastRefreshTime)
                    expectation.fulfill()
                }
                wait(for: [expectation], timeout: 1)
            }
        
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
