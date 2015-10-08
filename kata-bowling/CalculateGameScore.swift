//
//  CalculateGameScore
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

class CalculateGameScore {

    let parser: RollsParser
    
    
    init(rollsParser: RollsParser) {
        parser = rollsParser
    }
    
    func calculateScore(game: Game) -> Int {
        
        var score = 0

        for (idx, frame) in game.frames.enumerate() {
            if (idx == Constant.LastFrame) {
                frame.scoringStrategy = LastFrameScoreCalculationStrategy()
            }
            score += frame.getScore(Array(game.frames.suffixFrom(idx+1)))
        }
        
        return score
    }
}