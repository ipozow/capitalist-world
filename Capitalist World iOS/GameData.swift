//
//  DatosJuego.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 1/28/19.
//  Copyright © 2019 Pozo. All rights reserved.
//

import Foundation

struct GameData {
    var userInfo: UserInfo
    var lastUpdate: Date
    var balance: Double
    var structures: [Structure] // Todas las estructuras
}

struct UserInfo {
    var userName: String
    var userId: String
}

protocol Structure { // Esto es lo que tienen que tener las estructuras para que el jeugo funcione
    // Pondré unos ejemplos que me parecen bien
    var structureType: StructureType { get set } // Tipo de estructura
    var name: String  { get set } // El nombre de la estructura
    func incomePerMinute() -> Double // El oro que dará por minuto
    func onDestroy() // Por ejemplo, que pasa cuando se detruye
    func upgrade() // Por ejemplo, un método para subirlo de nivel
}


enum StructureType: String {
    case fabrica = "Fábrica"
    case granga = "Granja"
    case universidad = "Universidad"
    case etc = "Etc..."
}
