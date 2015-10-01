//
//  ThrowsParser.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//


struct Constant {
    static let Strike = 10
}

class RollsParser {
    
    func framesFromRolls(rolls: Array<Int>) -> Array<Frame> {
        var remainingRolls = rolls
        var frames: Array<Frame> = []
        
        while (!remainingRolls.isEmpty) {
            
            let firstRoll = remainingRolls.removeFirst()
            var secondRoll = 0
            
            if (firstRoll != Constant.Strike && !remainingRolls.isEmpty) {
                secondRoll = remainingRolls.removeFirst()
            }
            
            let frame = Frame(first: firstRoll, second: secondRoll)
            
            frames.append(frame)
        }
        
        return frames
    }
    
}
