//
//  FramePrinterTestCase.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import XCTest
@testable import kata_bowling

class FramePrinterTestCase: XCTestCase {

    func testPrint() {
//        let rolls = [9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0]
        let rolls = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]

        let game = Parser().parseRollsIntoGame(rolls)
        
        GamePrinter().printGame(game)
    }
}
