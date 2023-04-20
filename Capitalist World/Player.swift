//
//  Player.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 11-04-23.
//

import Foundation
import Combine

class Player: ObservableObject {
    @Published var money: Double
    
    init(money: Double) {
        self.money = money
    }
    
    func build(building: Building) {
        if money >= building.cost {
            money -= building.cost
        }
    }
}
