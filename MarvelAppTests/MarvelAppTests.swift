//
//  MarvelAppTests.swift
//  MarvelAppTests
//
//  Created by Степан Коленкин on 04.06.2024.
//

import XCTest
@testable import MarvelApp

final class MarvelAppTests: XCTestCase {
    
    var testedImage: UIImage?
    var avgColor: UIColor!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        testedImage = UIImage()
    }
    
    override func tearDownWithError() throws {
        testedImage = nil
        try super.tearDownWithError()
    }
    
    func testOnRedColor() throws {
        testedImage = UIImage()
        testedImage = testedImage?.fromColorToImage(color: UIColor.red)
        avgColor = testedImage?.averageColor()
        XCTAssertEqual(avgColor.toHexString(), UIColor.red.toHexString())
    }
    
    func testOnGreenColor() throws {
        testedImage = UIImage()
        testedImage = testedImage?.fromColorToImage(color: UIColor.green)
        avgColor = testedImage?.averageColor()
        XCTAssertEqual(avgColor.toHexString(), UIColor.green.toHexString())
    }
    
    func testOnBlueColor() throws {
        testedImage = UIImage()
        testedImage = testedImage?.fromColorToImage(color: UIColor.blue)
        avgColor = testedImage?.averageColor()
        XCTAssertEqual(avgColor.toHexString(), UIColor.blue.toHexString())
    }
    
    func testOnClearColor() throws {
        testedImage = UIImage()
        testedImage = testedImage?.fromColorToImage(color: UIColor.clear)
        avgColor = testedImage?.averageColor()
        XCTAssertEqual(avgColor.toHexString(), UIColor.clear.toHexString())
    }
    
    func testOnBlackColor() throws{
        testedImage = UIImage()
        testedImage = testedImage?.fromColorToImage(color: UIColor.black)
        avgColor = testedImage?.averageColor()
        XCTAssertEqual(avgColor.toHexString(), UIColor.black.toHexString())
    }
    
    func testOnPictureColor() throws {
        testedImage = UIImage(named: "spider-man")
        avgColor = testedImage?.averageColor()
        XCTAssertEqual(avgColor.toHexString(), "#64545CFF")
    }
    
}
