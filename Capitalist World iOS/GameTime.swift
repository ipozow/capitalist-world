//
//  GameTime.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 1/1/19.
//  Copyright © 2019 Pozo. All rights reserved.
//

import Foundation

class GameTime {
    var startGameTime: Date?
    var elapsedTime: TimeInterval = 0
    @objc dynamic func timeSpeed() {
        guard let startGameTime = startGameTime else {
            return
        }
        elapsedTime = startGameTime.timeIntervalSinceNow
        debugPrint(elapsedTime)
    }
}

func sellStockWhenAvailable() {
    
}
