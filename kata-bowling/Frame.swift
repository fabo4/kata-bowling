//
//  Frame.swift
//  kata-bowling
//
//  Created by Ondrej Fabian on 01/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

class Frame {
    
    let rolls: Array<Int>
    
    var firstRoll : Int {
        get {
            return rolls.first!
        }
    }
    
    var secondRoll : Int? {
        get {
            if (rolls.count > 1) {
                return rolls[1]
            } else {
                return nil
            }
        }
    }
    
    var thirdRoll : Int? {
        get {
            if (rolls.count > 2) {
                return rolls[2]
            } else {
                return nil
            }
        }
    }
    
    init(rolls: Array<Int>) {
        self.rolls = rolls
    }
    
    init(firstRoll: Int) {
        rolls = [firstRoll]
    }
    
    init(firstRoll: Int, secondRoll: Int) {
        rolls = [firstRoll, secondRoll]
    }
    
    init(firstRoll: Int, secondRoll: Int, thirdRoll: Int) {
        rolls = [firstRoll, secondRoll, thirdRoll]
    }
}
