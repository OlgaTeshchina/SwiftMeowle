//
//  SettingsPage.swift
//  meowleUITests
//
//  Created by Olga Teshchina on 21.05.2024.
//

import Foundation
import XCTest

private extension String {
    static let settingsScreenIdentifier = "settingsScreenViewController"
    static let identyfyerLogOutButton = "logOutFromApplication"
}

final class SettingsPage : BasePage {
    private lazy var settingsScreen = app.otherElements[.settingsScreenIdentifier]
    private lazy var logOutButton = app.buttons[.identyfyerLogOutButton]
    
    // Тапнуть по кнопке c прописанным accessibilityIdentifyer
    @discardableResult
    func tapLogOutButtonWithAccessibilityIdentifyer() -> SettingsPage {
        logOutButton.tap()
        return self
    }
    
    // Проверка, что экран "Настроек" открылся
    @discardableResult
    func checkThatSettingsScreenIsOpened() -> SettingsPage {
        XCTAssertTrue(settingsScreen.waitForExistence(timeout: .timeout))
        return self
    }
}
