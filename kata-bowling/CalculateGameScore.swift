//
//  CalculateGameScore
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//


protocol RollsParser {
    func parseRollsIntoGame(rolls: Array<Int>) -> Game
}

class CalculateGameScore {

    let parser: RollsParser
    
    
    init(rollsParser: RollsParser) {
        parser = rollsParser
    }
    
    func calculateScore(game: Game) -> Int {
        
        return -1
        
//        return rolls.reduce(0, combine: +)
    }
}