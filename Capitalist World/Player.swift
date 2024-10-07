//
//  Player.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 11-04-23.
//

import Foundation
import Combine

class PlayerModel: ObservableObject {
    @Published var money: Double
    
    init(money: Double) {
        self.money = money
    }
    
    init(from entity: PlayerEntity) {
        self.money = entity.money
    }

    func build(building: BuildingEntity) {
        if money >= building.cost {
            money -= building.cost
        }
    }
    
}
