//
//  CatActionsUITests.swift
//  meowleUITests
//
//

import Foundation
import XCTest

private extension String {
    static let catName = "Батон"
    static let likeCounterBefore = "5"
    static let likeCounterAfter = "6"
}

final class LikeCatUITests : BasePage {
    
    // MARK: - Tests
    
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
            .tapLikeButton()
            .checkLikeButtonCounter(expectedCounter: .likeCounterAfter)
    }
}
