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
    @IBAction func estructuraButtonTapped(_ sender: UIButton) {
        createNewView()
    }
    
    let estructuras = ["Tienda", "Granja", "Fábrica", "Casa", "Departamento", "Centro comercial", "Universidad", "Extracción de recursos naturales", "por definir"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return estructuras.count
    }
    
    var buildingView: UIView!
    var titleLabel: UILabel!
    var numbersCollectionView: UICollectionView!
    
    func createNewView() {
        // Initialize views and add them to the ViewController's view
        buildingView = UIView()
        buildingView.backgroundColor = .lightGray
        self.view.addSubview(buildingView)
        
        titleLabel = UILabel()
        titleLabel.text = "Nueva tienda"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
        buildingView.addSubview(titleLabel)
        
        // Set position of views using constraints
        buildingView.translatesAutoresizingMaskIntoConstraints = false
        buildingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        buildingView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        buildingView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        buildingView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: buildingView.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: buildingView.bottomAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: buildingView.widthAnchor, multiplier: 0.4).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: buildingView.heightAnchor, multiplier: 0.5).isActive = true
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
