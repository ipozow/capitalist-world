//
//  Construir.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 12/23/18.
//  Copyright © 2018 Pozo. All rights reserved.
//

import Foundation
import UIKit
import SQLite

class Construir: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var database: Connection!
    
    let tiendasTable = Table("tiendas")
    let idTable = Expression<String>("id")
    let productosTable = Expression<String?>("productos")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("tiendas").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        } catch {
            print(error)
        }
    }
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
    
    func createNewView() {

        let createTable = self.tiendasTable.create { (table) in
            table.column(self.idTable, primaryKey: true)
            table.column(self.productosTable)
        }
        do {
            try self.database.run(createTable)
            print("Tabla creada")
        } catch {
            print(error)
        }
        
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
    func buildNewStore() {
        //estaba pensando en poner todo en inglés porque si la definía como «buildNewTienda» sonaba demasiado mal XD
        let buildStore = self.tiendasTable.insert(self.productosTable <- productosTable)
        do {
            try self.database.run(buildStore)
            print("Tienda creada")
        } catch {
            print(error)
        }
    }
    func storeList() {
        do {
            let stores = try self.database.prepare(self.tiendasTable)
            for store in stores {
                print("Tienda: \(store[self.idTable])")
            }
        } catch {
            print(error)
        }
    }
    
}
