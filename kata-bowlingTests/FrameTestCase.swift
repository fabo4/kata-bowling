//
//  Frame.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_bowling

class FrameTestCase: XCTestCase {
    
    func testFrame() {
        let frame = Frame(first: 4, second: 5)
        XCTAssertEqual(frame.firstRoll, 4)
        XCTAssertEqual(frame.secondRoll, 5)
    }
}
