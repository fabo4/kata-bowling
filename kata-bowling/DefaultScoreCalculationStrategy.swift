//
//  DefaultScoreCalculationStrategy.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 07/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

class DefaultScoreCalculationStrategy : ScoreCalculationStrategy {
    
    func score(frame: Frame, followingFrames: Array<Frame>) -> Int {
        
        let frameTotal = frame.rolls.reduce(0, combine: +)
        var followingRolls: Array<Int> = []
        for frame in followingFrames {
            followingRolls += frame.rolls
        }
        
        var score = frameTotal
        
        if (frame.firstRoll == Constant.Strike) {
            score += followingRolls.prefix(2).reduce(0, combine: +)
        } else if (frameTotal == Constant.Spare) {
            score += followingFrames.first!.firstRoll
        }
        
        return score;
    }
}
