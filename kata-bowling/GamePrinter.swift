//
//  GamePrinter.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

//import Foundation

class GamePrinter {
    
    func printGame(game: Game) {
        
        var topLine: String = " "
        var paddingLine: String = "|"
        var scoreLine: String = "|"
        
        for frame in game.frames {
            topLine.appendContentsOf("----- ")
            paddingLine.appendContentsOf("     |")
            scoreLine.appendContentsOf(String(format: " \(stringFromRoll(frame.firstRoll)) \(stringFromPossibleRoll(frame.secondRoll)) |"))
        }
        
        print(topLine)
//        print(paddingLine)
        print(scoreLine)
//        print(paddingLine)
        print(topLine)
    }
    
    private func stringFromPossibleRoll(possibleRoll: Int?) -> String {
        if let roll = possibleRoll {
            return stringFromRoll(roll)
        } else {
            return "-"
        }
    }
    
    private func stringFromRoll(roll: Int) -> String {
        if (roll == 10) {
            return "X"
        } else {
            return String(roll)
        }
    }
}
