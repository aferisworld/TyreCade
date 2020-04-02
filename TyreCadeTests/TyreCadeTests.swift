//
//  TyreCadeTests.swift
//  TyreCadeTests
//
//  Created by Nana Aferi on 02/04/2020.
//  Copyright © 2020 Ank Dev. All rights reserved.
//

import XCTest
@testable import TyreCade

class TyreCadeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_checkUserInput_NullString() {
        let sut = CheckTyreInteractor()
        let expected = false
        let input:String? = nil
        let actual = sut.checkUserInput(input: input)
        XCTAssertEqual(actual, expected, "Should return false")
    }
    
    func test_checkUserInput_NonEmptyString() {
        let sut = CheckTyreInteractor()
        let expected = false
        let input:String? = "abcd"
        let actual = sut.checkUserInput(input: input)
        XCTAssertEqual(actual, expected, "Should return false")
    }
    
    func test_checkUserInput_ValidString() {
           let sut = CheckTyreInteractor()
           let expected = true
           let input:String? = "ajdnq1219"
           let actual = sut.checkUserInput(input: input)
           debugPrint("testCheckUserInput --> ", actual)
           XCTAssertEqual(actual, expected, "Should match")
    }

}
