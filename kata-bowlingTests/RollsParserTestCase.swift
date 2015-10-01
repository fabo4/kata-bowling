//
//  RollsParserTestCase.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_bowling

class RollsParserTestCase: XCTestCase {

    let parser: RollsParser = RollsParser()
    
    func testZeroRolls() {
        XCTAssertTrue(parser.framesFromRolls([]).isEmpty)
    }
    
    func testTwoRollsIntoOneFrame() {
        let frames = parser.framesFromRolls([4, 5])
        XCTAssertFalse(frames.isEmpty)
        XCTAssertEqual(frames.count, 1)
        
        let frame1 = frames.first
        XCTAssertEqual(frame1?.firstRoll, 4)
        XCTAssertEqual(frame1?.secondRoll, 5)
    }
    
    func testFiveRollsIntoThreeFrame() {
        let frames = parser.framesFromRolls([4, 5, 0, 3, 8])
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
        XCTAssertEqual(frame3.secondRoll, 0)
    }
    
    func testFiveRollsWithTwoStrikesIntoFourFrame() {
        let frames = parser.framesFromRolls([10, 5, 0, 10, 8])
        XCTAssertFalse(frames.isEmpty)
        XCTAssertEqual(frames.count, 4)
        
        let frame1 = frames[0]
        let frame2 = frames[1]
        let frame3 = frames[2]
        let frame4 = frames[3]
        
        XCTAssertEqual(frame1.firstRoll, 10)
        XCTAssertEqual(frame1.secondRoll, 0)
        
        XCTAssertEqual(frame2.firstRoll, 5)
        XCTAssertEqual(frame2.secondRoll, 0)
        
        
        XCTAssertEqual(frame3.firstRoll, 10)
        XCTAssertEqual(frame3.secondRoll, 0)
        
        XCTAssertEqual(frame4.firstRoll, 8)
    }
    
    func testTenStrikesIntoTenFrames() {
        let frames = parser.framesFromRolls([10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
        XCTAssertFalse(frames.isEmpty)
        XCTAssertEqual(frames.count, 10)
        
        for frame in frames {
            XCTAssertEqual(frame.firstRoll, 10)
            XCTAssertEqual(frame.secondRoll, 0)
        }
    }
    
}
