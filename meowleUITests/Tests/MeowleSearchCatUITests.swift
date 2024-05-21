//
//  MeowleSearchCatUITests.swift
//  meowleUITests
//
//  Created by a.gorshchak on 09.04.2024.
//

import XCTest

private extension String {
    static let catBaton = "Батон"
    static let nameOfCatAccordingSearchResults = "Батон ♂"
    static let catNo1 = "Кот №1"
    static let catNo2 = "Кот №2"
    static let catNo3 = "Кот №3"
}

final class MeowleSearchCatUITests: BasePage {
    
    // MARK: - Tests
    
    // Учимся прописывать (accessibilityIdentifyer) элементу. (Поиск котика):
    func testSearchOfAcat() {
        
        openApp(isAuthorised: true)
        
        MeowleSearchCatPage()
            .checkThatSearchScreenIsOpened()
            .tapSearchField()
            .typeTextTo(textField: .catBaton)
            .tapSearchButtonWithAccessibilityIdentifyer()
            .assertExistanceNameOf(cat: .catBaton)
            .tapCat(name: .catBaton)
            .assertExistanceNameOf(cat: .nameOfCatAccordingSearchResults)
    }
    
    // Добавлен тест
    func testAllCats() {
        setNetworkStub(for: "core/cats/allByLetter",
                       jsonFilename: "core_cats_allByLetter")
        
        openApp(isAuthorised: true)
        
        MeowleSearchCatPage()
            .tapAllNamesButtonWithAccessibilityIdentifyer()
        
        AllNamesPage()
            .assertExistanceNameOf(cat: .catNo1)
            .assertExistanceNameOf(cat: .catNo2)
            .assertExistanceNameOf(cat: .catNo3)
    }
}
