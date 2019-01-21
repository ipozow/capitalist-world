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
        cell.estructuraButton.titleLabel?.minimumScaleFactor = 0.5
        cell.estructuraButton.titleLabel?.numberOfLines = 0
        cell.estructuraButton.titleLabel?.adjustsFontSizeToFitWidth = true //por hacer: esto
        switch estructuras[indexPath.item] {
            case "Tienda":
                cell.costoLabel.text = "$ \(10000)"
                cell.manutenciónLabel.text = "$ \(10000)"
            case "Granja":
                cell.costoLabel.text = "$ \(20000)"
                cell.manutenciónLabel.text = "$ \(20000)"
                        case estructuras[2]:
                            cell.costoLabel.text = "$ \(40000)"
                            cell.manutenciónLabel.text = "$ \(40000)"
                        case estructuras[3]:
                            cell.costoLabel.text = "$ \(5000)"
                            cell.manutenciónLabel.text = "$ \(100)"
                        case estructuras[4]:
                            cell.costoLabel.text = "$ \(10000)"
                            cell.manutenciónLabel.text = "$ \(500)"
                        case estructuras[5]:
                            cell.costoLabel.text = "$ \(100000)"
                            cell.manutenciónLabel.text = "$ \(100000)"
                        case estructuras[6]:
                            cell.costoLabel.text = "$ \(50000)"
                            cell.manutenciónLabel.text = "$ \(10000)"
                        case estructuras[7]:
                            cell.costoLabel.text = "$ \(200000)"
                            cell.manutenciónLabel.text = "$ \(100000)"
                        case estructuras[8]:
                            cell.costoLabel.text = "$ \(10000)"
                            cell.manutenciónLabel.text = "$ \(10000)"
            default:
                break
        }
        
        cell.layer.masksToBounds = true;
        cell.layer.cornerRadius = 12
        return cell
    }

}
