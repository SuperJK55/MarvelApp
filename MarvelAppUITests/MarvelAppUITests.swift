//
//  MarvelAppUITests.swift
//  MarvelAppUITests
//
//  Created by Степан Коленкин on 04.06.2024.
//

import XCTest

final class MarvelAppUITests: XCTestCase {
    
    var app: XCUIApplication!
    var heroScreen: HeroScreen!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        
        heroScreen = HeroScreen(app: app)
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testFirstOnHeroNameList() {
        heroScreen.testOnHeroNameList()
    }
    func testSecondOnCorrectInfoAboutHero() {
        heroScreen.testOnCorrectInfoAboutHero()
    }
    func testThirdOnChangeTriangleColor() {
        heroScreen.testOnChangeTriangleColor()
    }
}
