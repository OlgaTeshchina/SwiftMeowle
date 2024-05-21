//
//  AuthUITests.swift
//  meowleUITests
//
//  Created by Olga Teshchina on 21.05.2024.
//

import Foundation
import XCTest

private extension String {
    static let userName = "Александр"
}

final class AuthUITests : BasePage {
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
            .tapLogOutButtonWithAccessibilityIdentifyer()
        
        MeowleAuthPage()
            .checkThatAuthScreenIsOpened()
    }
}
