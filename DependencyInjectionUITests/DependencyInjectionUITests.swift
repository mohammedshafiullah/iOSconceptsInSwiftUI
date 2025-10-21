//
//  DependencyInjectionUITests.swift
//  DependencyInjectionUITests
//
//  Created by mohammed Shafiullah on 21/10/25.
//

import XCTest

final class DependencyInjectionUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        app = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testLoginScreenElementsExist() {
           // Verify TextFields & Button exist
           XCTAssertTrue(app.textFields["UsernameTextField"].exists)
           XCTAssertTrue(app.secureTextFields["PasswordSecureField"].exists)
           XCTAssertTrue(app.buttons["LoginButton"].exists)
       }

       func testSuccessfulLoginFlow() {
           let usernameField = app.textFields["UsernameTextField"]
           let passwordField = app.secureTextFields["PasswordSecureField"]
           let loginButton = app.buttons["LoginButton"]

           usernameField.tap()
           usernameField.typeText("admin")

           passwordField.tap()
           passwordField.typeText("1234")

           loginButton.tap()

           // Wait for async response
           let successLabel = app.staticTexts["LoginSuccessLabel"]
           XCTAssertTrue(successLabel.waitForExistence(timeout: 3))
       }

       func testFailedLoginShowsError() {
           let usernameField = app.textFields["UsernameTextField"]
           let passwordField = app.secureTextFields["PasswordSecureField"]
           let loginButton = app.buttons["LoginButton"]

           usernameField.tap()
           usernameField.typeText("wronguser")

           passwordField.tap()
           passwordField.typeText("wrongpass")

           loginButton.tap()

           let errorLabel = app.staticTexts["LoginErrorLabel"]
           XCTAssertTrue(errorLabel.waitForExistence(timeout: 3))
       }
    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
