//
//  City.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 30-01-23.
//

import Foundation
import Combine

class City: NSObject, ObservableObject, Identifiable {
    
    @Published var buildings: [Building] = []
    
    let id = UUID()
    let name: String
    let population: Int
    let purchasingPowerIndex: Double
    let area: Double
    let buildableArea: Double
    var availableArea: Double
    var money: Double
    
    func build(building: Building, player: Player) {
        if player.money >= building.cost && availableArea >= building.space {
            availableArea -= building.space
            player.money -= building.cost
        }
    }
    
    enum BuildingType {
        case house
        case supermarket
    }
    
    init(name: String, population: Int, purchasingPowerIndex: Double, area: Double, buildableArea: Double) {
        self.name = name
        self.population = population
        self.purchasingPowerIndex = purchasingPowerIndex
        self.area = area
        self.buildableArea = buildableArea
        self.availableArea = buildableArea
        self.money = 0
    }
}



