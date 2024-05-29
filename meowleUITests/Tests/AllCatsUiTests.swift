//
//  AllCatsUiTests.swift
//  meowleUITests
//
//

import XCTest

private extension String {
    static let catNo1 = "Кот №1"
    static let catNo2 = "Кот №2"
    static let catNo3 = "Кот №3"
}

final class AllCatsUiTests: BasePage {
    
    // MARK: - Tests

    func testAllCats() {
        setNetworkStub(for: "core/cats/allByLetter",
                       jsonFilename: "core_cats_allByLetter")
        
        openApp(isAuthorised: true)
        
        MeowleSearchCatPage()
            .tapAllNamesButton()
        AllNamesPage()
            .assertExistanceNameOf(cat: .catNo1)
            .assertExistanceNameOf(cat: .catNo2)
            .assertExistanceNameOf(cat: .catNo3)
    }
}
