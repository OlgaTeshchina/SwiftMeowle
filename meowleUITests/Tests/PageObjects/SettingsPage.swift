//
//  SettingsPage.swift
//  meowleUITests
//
//

import Foundation
import XCTest

private extension String {
    static let settingsScreenIdentifier = "settingsScreenViewController"
    static let identyfyerLogOutButton = "logOutFromApplication"
}

final class SettingsPage : BasePage {
    
    // MARK: - Elements

    private lazy var settingsScreen = app.otherElements[.settingsScreenIdentifier]
    private lazy var logOutButton = app.buttons[.identyfyerLogOutButton]
    
    // MARK: - Actions
    
    // Тапнуть по кнопке c прописанным accessibilityIdentifyer
    @discardableResult
    func tapLogOutButton() -> SettingsPage {
        logOutButton.tap()
        return self
    }
    
    // MARK: - Asserts
    
    // Проверка, что экран "Настроек" открылся
    @discardableResult
    func checkThatSettingsScreenIsOpened() -> SettingsPage {
        XCTAssertTrue(settingsScreen.waitForExistence(timeout: .timeout))
        return self
    }
}
