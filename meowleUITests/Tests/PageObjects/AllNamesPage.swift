//
//  AllNamesPage.swift
//  meowleUITests
//
//

import Foundation
import XCTest

final class AllNamesPage : BasePage {
    
    // MARK: - Actions
    
    // Проверка наличия имени котика
    @discardableResult
    func assertExistanceNameOf(cat: String) -> AllNamesPage {
        XCTAssertTrue(app.staticTexts[cat].waitForExistence(timeout: .timeout))
        return self
    }
}
