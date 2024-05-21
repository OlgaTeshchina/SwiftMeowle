//
//  AllNamesPage.swift
//  meowleUITests
//
//  Created by Olga Teshchina on 21.05.2024.
//

import Foundation
import XCTest

final class AllNamesPage : BasePage {
    
    // Проверка наличия имени котика
    @discardableResult
    func assertExistanceNameOf(cat: String) -> AllNamesPage {
        XCTAssertTrue(app.staticTexts[cat].waitForExistence(timeout: .timeout))
        return self
    }
}
