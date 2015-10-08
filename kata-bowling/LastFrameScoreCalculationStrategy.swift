//
//  LastFrameScoreCalculationStrategy.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 07/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

class LastFrameScoreCalculationStrategy : ScoreCalculationStrategy {
    func score(frame: Frame, followingFrames: Array<Frame>) -> Int {
        return frame.rolls.reduce(0, combine: +)
    }
}
