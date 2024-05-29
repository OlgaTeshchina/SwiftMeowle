//
//  CatDetailedPage.swift
//  meowleUITests
//
//

import Foundation
import XCTest

private extension String {
    static let detailedScreenIdentifier = "catScreenViewController"
    static let identyfyerLikeButton = "likeButton"
    static let likeCounterBaseText = "👍 "
}

final class CatDetailedPage : BasePage {
    
    // MARK: - Elements
    
    private lazy var detailedScreen = app.otherElements[.detailedScreenIdentifier]
    private lazy var likeButton = app.buttons[.identyfyerLikeButton]
    
    // MARK: - Actions
    
    // Тапнуть по кнопке c прописанным accessibilityIdentifyer
    @discardableResult
    func tapLikeButton() -> CatDetailedPage {
        likeButton.tap()
        return self
    }
    
    // MARK: - Asserts
    
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
