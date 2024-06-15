//
//  Screen.swift
//  MarvelAppUITests
//
//  Created by Степан Коленкин on 04.06.2024.
//

import XCTest
import Foundation

protocol Screen {
    var app: XCUIApplication { get }
}

struct HeroScreen: Screen {
    let app: XCUIApplication
    
    private enum Identifiers {
        static let mainCollectionView = "mainCollectionView"
        static let cardHeroName = "cardHeroNameLabel"
        static let detailedHeroName = "detailedHeroNameLabel"
        static let infoAboutHero = "infoAboutHeroLabel"
        static let backButton = "backOnMainScreenButton"
        static let triangle = "backgroundColoredTriangle"
    }
    
    private var mainCollectionView: XCUIElement {
        return app.collectionViews[Identifiers.mainCollectionView]
    }
    
    private var backButton: XCUIElement {
        return app.buttons.containing(.button, identifier: Identifiers.backButton).element
    }
    
    private var firstHero: XCUIElement {
        return mainCollectionView.cells.element(boundBy: 0)
    }
    
    private var secondHero: XCUIElement {
        return mainCollectionView.cells.element(boundBy: 1)
    }
    
    private var thirdHero: XCUIElement {
        return mainCollectionView.cells.element(boundBy: 2)
    }
    
    private var firstHeroCard: XCUIElement {
        return thirdHero.staticTexts.containing(.staticText, identifier: Identifiers.cardHeroName).element
    }
    
    private var backButtons: XCUIElement {
        return app.buttons.containing(.button, identifier: Identifiers.backButton).element
    }
    
    private var firstHeroName: String {
        return firstHero.staticTexts.containing(.staticText, identifier: Identifiers.cardHeroName).element.label
    }
    
    private var secondHeroName: String {
        return secondHero.staticTexts.containing(.staticText, identifier: Identifiers.cardHeroName).element.label
    }
    
    private var thirdHeroName: String {
        return thirdHero.staticTexts.containing(.staticText, identifier: Identifiers.cardHeroName).element.label
    }
    private var triangleViewColorString: String {
        return app.otherElements[Identifiers.triangle].label
    }
    
    func testOnHeroNameList() -> Self {
        app.launch()
        
        XCTAssertEqual(mainCollectionView.cells.count, 3)
        XCTAssertTrue(firstHero.exists)
        XCTAssertEqual(firstHeroName, "Spider-Man")
        XCTAssertTrue(secondHero.exists)
        XCTAssertEqual(secondHeroName, "Iron Man")
        
        return self
    }
    
    func testOnCorrectInfoAboutHero() -> Self {
        app.launch()
        
        XCTAssertEqual(mainCollectionView.cells.count, 3)
        XCTAssertTrue(firstHero.exists)
        
        ///tap on card for write name hero in card
        firstHeroCard.tap()
        
        ///check info and name on exists and write them
        let firstInfoAboutHeroName = app.staticTexts.containing(.staticText, identifier: Identifiers.detailedHeroName).element
        XCTAssertTrue(firstInfoAboutHeroName.exists)
        let firstInfoAboutHeroNameLabel = firstInfoAboutHeroName.label
        
        let firstInfoAboutHero = app.staticTexts.containing(.staticText, identifier: Identifiers.infoAboutHero).element
        XCTAssertTrue(firstInfoAboutHero.exists)
        let firstInfoAboutHeroLabel = firstInfoAboutHero.label
        
        ///back on main menu
        backButtons.tap()
        
        ///compare name and description
        XCTAssertEqual(firstInfoAboutHeroLabel, "He is crazy man")
        XCTAssertEqual(thirdHeroName, firstInfoAboutHeroNameLabel)
        
        return self
    }
    
    func testOnChangeTriangleColor() -> Self {
        app.launch()
        
        ///swipe left and right for change color on card color
        app.swipeLeft()
        app.swipeRight()
        
        ///write current color
        let triangleBeforeSwipe = triangleViewColorString
        ///swipe left for change color
        app.swipeLeft()
        
        ///write color after swipe
        let triangleAfterLeftSwipe = triangleViewColorString
        
        ///swipe right for change color on first card color
        app.swipeRight()
        
        ///write color after right swipe
        let triangleAfterRightSwipe = triangleViewColorString
        
        ///compare color
        XCTAssertNotEqual(triangleBeforeSwipe, triangleAfterLeftSwipe)
        XCTAssertEqual(triangleBeforeSwipe, triangleAfterRightSwipe)
        
        return self
    }
}

