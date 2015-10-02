//
//  RollsParserTestCase.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_bowling

class ParserTestCase: XCTestCase {

    let parser = Parser()
    
    func testZeroRolls() {
        let rolls: Array<Int> = []
        let frames = parser.parseRollsIntoGame(rolls).frames
        XCTAssertTrue(frames.isEmpty)
    }
    
    func testTwoRollsIntoOneFrame() {
        let rolls: Array<Int> = [4, 5]
        let frames = parser.parseRollsIntoGame(rolls).frames
        
        XCTAssertFalse(frames.isEmpty)
        XCTAssertEqual(frames.count, 1)
        
        let frame1 = frames.first
        XCTAssertEqual(frame1?.firstRoll, 4)
        XCTAssertEqual(frame1?.secondRoll, 5)
    }
    
    func testFiveRollsIntoThreeFrame() {
        let rolls: Array<Int> = [4, 5, 0, 3, 8]
        let frames = parser.parseRollsIntoGame(rolls).frames
        
        XCTAssertFalse(frames.isEmpty)
        XCTAssertEqual(frames.count, 3)
        
        let frame1 = frames[0]
        let frame2 = frames[1]
        let frame3 = frames[2]
        
        XCTAssertEqual(frame1.firstRoll, 4)
        XCTAssertEqual(frame1.secondRoll, 5)
        
        XCTAssertEqual(frame2.firstRoll, 0)
        XCTAssertEqual(frame2.secondRoll, 3)
        
        
        XCTAssertEqual(frame3.firstRoll, 8)
        XCTAssertNil(frame3.secondRoll)
    }
    
    func testFiveRollsWithTwoStrikesIntoFourFrame() {
        let rolls: Array<Int> = [10, 5, 0, 10, 8]
        let frames = parser.parseRollsIntoGame(rolls).frames

        XCTAssertFalse(frames.isEmpty)
        XCTAssertEqual(frames.count, 4)
        
        let frame1 = frames[0]
        let frame2 = frames[1]
        let frame3 = frames[2]
        let frame4 = frames[3]
        
        XCTAssertEqual(frame1.firstRoll, 10)
        XCTAssertNil(frame1.secondRoll)
        
        XCTAssertEqual(frame2.firstRoll, 5)
        XCTAssertEqual(frame2.secondRoll, 0)
        
        
        XCTAssertEqual(frame3.firstRoll, 10)
        XCTAssertNil(frame3.secondRoll)
        
        XCTAssertEqual(frame4.firstRoll, 8)
    }
    
    func testTwelveStrikesIntoTenFrames() {
        let rolls: Array<Int> = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
        let frames = parser.parseRollsIntoGame(rolls).frames
        
        XCTAssertFalse(frames.isEmpty)
        XCTAssertEqual(frames.count, 10)
        
        for frame in frames.prefixUpTo(9) {
            XCTAssertEqual(frame.firstRoll, 10)
            XCTAssertNil(frame.secondRoll)
        }
        
        let lastFrame = frames.last!
        XCTAssertEqual(lastFrame.firstRoll, 10)
        XCTAssertEqual(lastFrame.secondRoll, 10)
        XCTAssertEqual(lastFrame.thirdRoll, 10)
    }
    
}
