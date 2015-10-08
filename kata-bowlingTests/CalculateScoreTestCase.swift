//
//  CalculateScoreTestCase.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_bowling

class CalculateScoreTestCase: XCTestCase {
    
    let scoreCalculator = CalculateGameScore(rollsParser: Parser())
    
    func testFrameScore() {
        let frame1 = Frame(firstRoll: 3, secondRoll: 5)
        XCTAssertEqual(frame1.getScore([]), 8)
    }
    
    func testFrameScoreWithSpare() {
        let frame1 = Frame(firstRoll: 3, secondRoll: 7)
        let frame2 = Frame(firstRoll: 3, secondRoll: 5)
        XCTAssertEqual(frame1.getScore([frame2]), 13)
    } 
    
    func testFrameScoreWithStrikeAndSomething() {
        let frame1 = Frame(firstRoll: 10)
        let frame2 = Frame(firstRoll: 3, secondRoll: 5)
        XCTAssertEqual(frame1.getScore([frame2]), 18)
    }
    
    func testFrameScoreWithStrikeAndStrike() {
        let frame1 = Frame(firstRoll: 10)
        let frame2 = Frame(firstRoll: 10)
        let frame3 = Frame(firstRoll: 3, secondRoll: 5)
        XCTAssertEqual(frame1.getScore([frame2, frame3]), 23)
    }
    
    func testPenultimateFrameScoreWithStrikeAndStrike() {
        let frame1 = Frame(firstRoll: 10)
        let frame2 = Frame(firstRoll: 10, secondRoll: 3, thirdRoll: 5)
        XCTAssertEqual(frame1.getScore([frame2]), 23)
    }
    
    func testLastFrameScore() {
        let frame1 = Frame(firstRoll: 5, secondRoll: 3)
        XCTAssertEqual(frame1.getScore([]), 8)
    }
    
    func testLastFrameScoreWithStrike() {
        let frame1 = Frame(firstRoll: 10, secondRoll: 3, thirdRoll: 5)
        XCTAssertEqual(frame1.getScore([]), 18)
    }
    
    func testLastFrameScoreWithStrikes() {
        let frame1 = Frame(firstRoll: 10, secondRoll: 10, thirdRoll: 5)
        let frame2 = Frame(firstRoll: 10, secondRoll: 3, thirdRoll: 5)

        frame1.scoringStrategy = LastFrameScoreCalculationStrategy()
        
        XCTAssertEqual(frame1.getScore([frame2]), 25)
    }
    
    func testAllPairsOfNineAndMiss() {
        let game = Parser().parseRollsIntoGame([9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0])
        XCTAssertEqual(90, scoreCalculator.calculateScore(game));
    }

    func testAllStrikes() {
        let game = Parser().parseRollsIntoGame([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
        XCTAssertEqual(300, scoreCalculator.calculateScore(game));
    }
    
    func testAllSparesAndBonusFive() {
        let game = Parser().parseRollsIntoGame([5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5])
        XCTAssertEqual(150, scoreCalculator.calculateScore(game));
    }
}
