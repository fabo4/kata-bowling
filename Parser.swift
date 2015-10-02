//
//  Parser
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//


struct Constant {
    static let Strike = 10
    static let PenultimateFrame = 9
}

class Parser : RollsParser {
    
    private var remainingRolls: Array<Int>!
    private var frames: Array<Frame>!
    
    func parseRollsIntoGame(rolls: Array<Int>) -> Game {
        remainingRolls = rolls
        let game = Game(frames: getFrames())
        return game
    }
    
    private func getFrames() -> Array<Frame> {
        frames = []

        while (!remainingRolls.isEmpty) {
            frames.append(parseNextFrame())
        }
        return frames
    }
    
    private func parseNextFrame() -> Frame {
        if (isParsingLastFrame()) {
            let lastFrame = Frame(rolls: remainingRolls)
            remainingRolls.removeAll()
            return lastFrame
            
        } else {
            return parseOneFrame()
        }
    }
    
    private func isParsingLastFrame() -> Bool {
        return (frames.count == Constant.PenultimateFrame)
    }
    
    private func parseOneFrame() -> Frame {

        let firstRoll = remainingRolls.removeFirst()
        
        if (firstRoll != Constant.Strike && !remainingRolls.isEmpty) {
            return Frame(firstRoll: firstRoll, secondRoll: remainingRolls.removeFirst())
        } else {
            return Frame(firstRoll: firstRoll)
        }
    }
    
}
