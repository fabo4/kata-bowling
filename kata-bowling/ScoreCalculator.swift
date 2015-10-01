//
//  Scoreboard.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

class ScoreCalculator {
    
    func calculateScore(rolls: Array<Int>) -> Int {
        
        return rolls.reduce(0, combine: +)
    }
}