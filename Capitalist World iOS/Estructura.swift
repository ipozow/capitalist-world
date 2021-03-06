//
//  Estructuras.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 1/22/19.
//  Copyright © 2019 Pozo. All rights reserved.
//

import Foundation
import UIKit

struct Estructura {
    var nombre: String
    var precio: Int
    var manutención: Int
}

class Tienda: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var tiendaCollectionView: UICollectionView!
    var shopSellingProducts = ["initial"]
    let addProduct = ["add"]
    let addProductImage: [UIImage] = [UIImage(named: "add")!]
    
    let productImages = Comprar().productImages
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopSellingProducts.count
    }
    
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        
    }
    //por hacer: que se puedan eliminar los productos al arrastrar la celda hacia abajo
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! EstructuraTienda
        cell.productImage.image = productImages[indexPath.item]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.masksToBounds = true;
        cell.layer.cornerRadius = 16
        
        for _ in shopSellingProducts {
            
            if shopSellingProducts.count == 5 {
                shopSellingProducts.removeLast()
            }

        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
    }
    
    func removeFirstProduct() {
        shopSellingProducts.removeFirst()
    }
    
    override func viewDidLoad() {
        //removeFirstProduct()
        
    }
    
}

class TiendaSelectorPopUp: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var availableProductsCollection: UICollectionView!
    
    var productsBought = [""]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsBought.count
    }
    
    @IBAction func productTapped(_ sender: UIButton) {
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AvailableProducts
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.masksToBounds = true;
        cell.layer.cornerRadius = 2
        return cell
    }
}
