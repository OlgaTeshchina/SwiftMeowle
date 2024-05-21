//
//  CatActionsUITests.swift
//  meowleUITests
//
//  Created by Olga Teshchina on 21.05.2024.
//

import Foundation
import XCTest

private extension String {
    static let catName = "Батон"
    static let likeCounterBefore = "5"
    static let likeCounterAfter = "6"
}

final class CatActionsUITests : BasePage {
    func testLikeCat() {
        setNetworkStub(for: "core/cats/search",
                       jsonFilename: "core_cats_search")
        
        openApp(isAuthorised: true)
        
        MeowleSearchCatPage()
            .checkThatSearchScreenIsOpened()
            .tapSearchField()
            .typeTextTo(textField: .catName)
            .tapSearchButtonWithAccessibilityIdentifyer()
            .assertExistanceNameOf(cat: .catName)
            .tapCat(name: .catName)
        
        CatDetailedPage()
            .checkThatDetailedScreenIsOpened()
            .checkLikeButtonCounter(expectedCounter: .likeCounterBefore)
            .tapLikeButtonWithAccessibilityIdentifyer()
            .checkLikeButtonCounter(expectedCounter: .likeCounterAfter)
    }
}
