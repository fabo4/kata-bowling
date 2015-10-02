//
//  GameTestCase.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 02/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_bowling

class GameTestCase: XCTestCase {

    func testGame() {
        let frame1 = Frame(firstRoll: 1, secondRoll: 2)
        let frame2 = Frame(firstRoll: 3, secondRoll: 4)
        let game = Game(frames:[frame1, frame2])
        
        XCTAssertEqual(game.frames.count, 2)
    }
}
