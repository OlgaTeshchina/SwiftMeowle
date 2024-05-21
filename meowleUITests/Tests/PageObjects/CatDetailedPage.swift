//
//  CatDetailedPage.swift
//  meowleUITests
//
//  Created by Olga Teshchina on 21.05.2024.
//

import Foundation
import XCTest

private extension String {
    static let detailedScreenIdentifier = "catScreenViewController"
    static let identyfyerLikeButton = "likeButton"
    static let likeCounterBaseText = "👍 "
}

final class CatDetailedPage : BasePage {
    private lazy var detailedScreen = app.otherElements[.detailedScreenIdentifier]
    private lazy var likeButton = app.buttons[.identyfyerLikeButton]
    
    // Тапнуть по кнопке c прописанным accessibilityIdentifyer
    @discardableResult
    func tapLikeButtonWithAccessibilityIdentifyer() -> CatDetailedPage {
        likeButton.tap()
        return self
    }
    
    // Проверка, что экран открылся
    @discardableResult
    func checkThatDetailedScreenIsOpened() -> CatDetailedPage {
        XCTAssertTrue(detailedScreen.waitForExistence(timeout: .timeout))
        return self
    }
    
    // Проверка счетчика лайков
    func checkLikeButtonCounter(expectedCounter: String) -> CatDetailedPage {
        XCTAssertTrue(app.staticTexts[.likeCounterBaseText + expectedCounter].waitForExistence(timeout: .timeout))
        return self
    }
}
