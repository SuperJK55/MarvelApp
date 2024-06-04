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
    
    func testHeroScreen() {
        HeroScreen(app: app)
            .testOnHeroNameList()
            .testOnCorrectInfoAboutHero()
            .testOnChangeTriangleColor()
    }
}
