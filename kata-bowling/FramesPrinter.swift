//
//  FramesPrinter.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

//import Foundation

class FramesPrinter {
    
    func printFrames(frames: Array<Frame>) {
        
        var topLine: String = " "
        var paddingLine: String = "|"
        var scoreLine: String = "|"
        
        for frame in frames {
            topLine.appendContentsOf("----- ")
            paddingLine.appendContentsOf("     |")
            scoreLine.appendContentsOf(String(format: " \(indentedStringFromRoll(frame.firstRoll)) \(indentedStringFromRoll(frame.secondRoll)) |"))
        }
        
        print(topLine)
//        print(paddingLine)
        print(scoreLine)
//        print(paddingLine)
        print(topLine)
    }
    
    private func indentedStringFromRoll(roll: Int) -> String {
        switch roll {
        case 0:
            return "-"
        case 10:
            return "X"
        default:
            return String(roll)
        }
        
    }
}
