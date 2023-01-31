//
//  Building.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 30-01-23.
//

import Foundation

enum BuildingType: String, CaseIterable {
    case house = "Casa"
    case supermarket = "Supermercado"
}

struct Building {
    let type: BuildingType
    let space: Double
    let cost: Double
    
    static let house = Building(type: .house, space: 150, cost: 1000)
    static let supermarket = Building(type: .supermarket, space: 2000, cost: 175000)
}
