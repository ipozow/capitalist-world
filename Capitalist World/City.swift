//
//  City.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 30-01-23.
//

import Foundation

class City: ObservableObject {
    let name: String
    let population: Int
    let purchasingPowerIndex: Double
    let area: Double
    let buildableArea: Double
    var availableArea: Double
    var money: Double
    
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
    
    func build(building: BuildingType) {
        switch building {
        case .house:
            if availableArea >= 150 {
                availableArea -= 150
                money -= 1000
            }
        case .supermarket:
            if availableArea >= 2000 {
                availableArea -= 2000
                money -= 175000
            }
        }
    }
}



