//
//  DatosJuego.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 1/28/19.
//  Copyright © 2019 Pozo. All rights reserved.
//

import Foundation

struct GameData {
    var dinero: Int
    var stock: StockData
    var tienda: [Tienda]
    var lastUpdate: Date
}
