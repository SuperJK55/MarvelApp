//
//  MarvelAppUITests.swift
//  MarvelAppUITests
//
//  Created by Степан Коленкин on 04.06.2024.
//

import XCTest

final class MarvelAppUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testOnHeroNameList() throws {
        app.launch()
        
        let cells = app.collectionViews["mainCollectionView"].cells
        XCTAssertEqual(cells.count, 3)
        
        let firstHeroName = cells.element(boundBy: 0).staticTexts.containing(.staticText, identifier: "cardHeroName").element.label
        XCTAssertEqual(firstHeroName, "Spider-Man")
        
        let secondHeroName = cells.element(boundBy: 1).staticTexts.containing(.staticText, identifier: "cardHeroName").element.label
        XCTAssertEqual(secondHeroName, "Iron Man")
    }
    
    func testOnCorrectInfoAboutHero() throws {
        app.launch()
        
        let cells = app.collectionViews["mainCollectionView"].cells
        XCTAssertEqual(cells.count, 3)
        
        let firstCell = cells.element(boundBy: 2)
        let firstHeroCard = firstCell.staticTexts.containing(.staticText, identifier: "cardHeroName").element
        let firstCellHeroName = firstHeroCard.label
        
        firstHeroCard.tap()
        
        let firstInfoAboutHeroName = app.staticTexts.containing(.staticText, identifier: "detailedHeroName").element.label
        let firstInfoAboutHero = app.staticTexts.containing(.staticText, identifier: "infoAboutHero").element.label
        
        let backButton = app.buttons.containing(.button, identifier: "backOnMainScreenButton").element
        backButton.tap()
        
        app.swipeLeft()
        
        let secondCell = cells.element(boundBy: 1)
        let secondHeroCard = secondCell.staticTexts.containing(.staticText, identifier: "cardHeroName").element
        let secondCellHeroName = secondHeroCard.label
        
        secondHeroCard.tap()
        
        let secondInfoAboutHeroName = app.staticTexts.containing(.staticText, identifier: "detailedHeroName").element.label
        let secondInfoAboutHero = app.staticTexts.containing(.staticText, identifier: "infoAboutHero").element.label
        
        XCTAssertEqual(firstInfoAboutHero, "He is crazy man")
        XCTAssertEqual(firstCellHeroName, firstInfoAboutHeroName)
        
        XCTAssertEqual(secondInfoAboutHero, "Description")
        XCTAssertEqual(secondCellHeroName, secondInfoAboutHeroName)
        
        backButton.tap()
    }
    
    func testOnChangeTriangleColor() throws {
        app.launch()
        
        app.swipeLeft()
        app.swipeRight()
        
        let triangleBeforeSwipe = app.otherElements["backgroundColoredTriangle"].label
        app.swipeLeft()
        
        let triangleAfterLeftSwipe = app.otherElements["backgroundColoredTriangle"].label
        
        app.swipeRight()
        
        let triangleAfterRightSwipe = app.otherElements["backgroundColoredTriangle"].label
        
        XCTAssertNotEqual(triangleBeforeSwipe, triangleAfterLeftSwipe)
        XCTAssertEqual(triangleBeforeSwipe, triangleAfterRightSwipe)
        
    }
}
