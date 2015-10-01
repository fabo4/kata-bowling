//
//  kata_bowlingTests.swift
//  kata-bowlingTests
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_bowling

class ScoreCalculatorTestCase: XCTestCase {
    
    let scoreCalculator = ScoreCalculator()
    
    func testAllPairsOfNineAndMiss() {
        XCTAssertEqual(90, scoreCalculator.calculateScore([9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0]));
    }

//    func testAllStrikes() {
//        XCTAssertEqual(300, scoreCalculator.calculateScore([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]));
//    }
    
//    func testAllSparesAndBonusFive() {
//        XCTAssertEqual(150, scoreCalculator.calculateScore([5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]));
//    }
}
