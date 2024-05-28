//
//  AuthUITests.swift
//  meowleUITests
//
//

import Foundation
import XCTest

private extension String {
    static let userName = "Александр"
}

final class AuthUITests : BasePage {
    
    // MARK: - Tests
    
    func testLogIn() {
        openApp(isAuthorised: false)
        
        MeowleAuthPage()
            .taptextField()
            .typeTextTo(textField: .userName)
            .tapEnterButton()
        MeowleSearchCatPage()
            .checkThatSearchScreenIsOpened()
    }
    
    func testLogOut() {
        openApp(isAuthorised: true)
        
        MeowleSearchCatPage()
            .checkThatSearchScreenIsOpened()
            .tapSettingsButton()
        SettingsPage()
            .checkThatSettingsScreenIsOpened()
            .tapLogOutButton()
        MeowleAuthPage()
            .checkThatAuthScreenIsOpened()
    }
}
