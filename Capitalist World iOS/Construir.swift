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
    
    let estructuras: [Estructura] = [Estructura(nombre: "Tienda", precio: 10000, manutención: 1000),
                                     Estructura(nombre: "Granja", precio: 20000, manutención: 2000),
                                     Estructura(nombre: "Fábrica", precio: 40000, manutención: 4000),
                                     Estructura(nombre: "Casa", precio: 5000, manutención: 100),
                                     Estructura(nombre: "Departamento", precio: 10000, manutención: 500),
                                     Estructura(nombre: "Centro comercial", precio: 100000, manutención: 100000),
                                     Estructura(nombre: "Universidad", precio: 50000, manutención: 10000),
                                     Estructura(nombre: "Extracción de recursos naturales", precio: 200000, manutención: 100000),
                                     Estructura(nombre: "por definir", precio: 10000, manutención: 10000)]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return estructuras.count
    }
    
    var buildingView: UIView!
    var titleLabel: UILabel!
    var numbersCollectionView: UICollectionView!
    
    func createNewView() { //aquí quería hacer una copia del Tienda Scene del Main.storyboard más que un popup. Entonces sería que cada vez que se use esta func se cree una copia del Tienda Scene con sus propios datos, para que así se puedan crear varias tiendas. Ni idea cómo hacer la base de datos. Esta función debería ser capaz de copiar datos, pero no sé cómo hacerlo. Creo que podría hacer que se lean estos datos que se creen al hacer una nueva tienda y el mismo scene, solo que leería datos distintos. En resumen: Tienda Scene como modelo y cargan los datos según la tienda que se seleccione. Ojalá no me olvide de lo que estaba pensando cuando escribí esto porque intenté ser lo más detallado para no olvidarme, y creo que sería gracioso que alguien más vea esto —y que hice un commit solo para esto—. xd
        // Initialize views and add them to the ViewController's view
        buildingView = UIView()
        buildingView.backgroundColor = .lightGray
        buildingView.frame.origin.y -= 50
        self.view.addSubview(buildingView)

        titleLabel = UILabel()
        titleLabel.text = "Nueva tienda"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
        buildingView.addSubview(titleLabel)
        UIView.animate(withDuration: 1.0) {
            self.buildingView.frame.origin.y += 50
            UIView.animate(withDuration: 1.0, delay: 2.0, animations: {
                self.buildingView.alpha = 0.0
            }, completion: { (_) in
                self.buildingView.removeFromSuperview()
            })
        }
        
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
        cell.estructuraButton.setTitle("\(estructuras[indexPath.item].nombre)", for: .normal)
        cell.estructuraButton.titleLabel?.minimumScaleFactor = 0.5
        cell.estructuraButton.titleLabel?.numberOfLines = 0
        cell.estructuraButton.titleLabel?.adjustsFontSizeToFitWidth = true //por hacer: esto
        cell.costoLabel.text = "$ \(estructuras[indexPath.row].precio)"
        cell.manutenciónLabel.text = "$ \(estructuras[indexPath.row].manutención)"
        
        cell.layer.masksToBounds = true;
        cell.layer.cornerRadius = 12
        return cell
        

    }

}
