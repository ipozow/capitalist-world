//
//  Construir.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 12/23/18.
//  Copyright © 2018 Pozo. All rights reserved.
//

import Foundation
import UIKit

class Construir: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var estructurasCollectionView: UICollectionView!
    
    let estructuras = ["Tienda", "Granja", "Fábrica", "Casa", "Departamento", "Centro comercial", "Universidad", "Extracción de recursos naturales", "por definir"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return estructuras.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ConstruirCollectionView
        cell.estructuraButton.setTitle("\(estructuras[indexPath.item])", for: .normal)
        switch estructuras {
        case ["Tienda"]:
            let precio = 10000
        default:
            <#code#>
        }
        cell.layer.masksToBounds = true;
        cell.layer.cornerRadius = 12
        return cell
    }
}
