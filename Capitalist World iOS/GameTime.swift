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
        
    }
    
    var time = NSTimeIntervalSince1970
    
    func sellWhenTime() {
        defaults.set(time, forKey: key)
        time = defaults.double(forKey: key)
        if NSTimeIntervalSince1970 - time >= 1 {
            sellStockWhenAvailable()
        }
    }

    var timestand: Double!
    let defaults = UserDefaults.standard
    let key = "timeStarted"
    
    func startTiming() {
        timestand = Date().timeIntervalSinceReferenceDate
    }
    

    func sellStockWhenAvailable() {
        if appleSeedsData.stock >= 10 {
            appleSeedsData.stock -= 10
        }
        if applesData.stock >= 10 {
            applesData.stock -= 10
        }
        print("hello")
    }

}



let timeBetweenSales = 5



