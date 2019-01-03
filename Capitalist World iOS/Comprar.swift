//
//  Comprar.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 12/21/18.
//  Copyright © 2018 Pozo. All rights reserved.
//

import Foundation
import UIKit

class Comprar: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //gestos para volver al ViewController
    
    //
    @IBOutlet weak var collectionView: UICollectionView!
    
    let products = ["apple", "seeds"]

    let productImages: [UIImage] = [
        UIImage(named: "apple")!,
        UIImage(named: "seeds")!
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.productImageView.image = productImages[indexPath.item]
        return cell
    }
    
    @IBOutlet weak var userAvailableStockLabel: UILabel!
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let cantidad = sender.text {
            print(cantidad)
        }
    }
    //Por hacer: guardar el valor de cantidad en una variable para luego usarla en el botón de compra
    @IBAction func textFieldTouchUpOutside(_ sender: UITextField) {
        if let cantidad = sender.text {
            print(cantidad)
        }
    }

    @IBAction func buyApplesButton(_ sender: UIButton) {
        dineroShared.dinero += 10
        ViewController().saveDinero()
    }
    
    
    var shopAvailableStock = AvailableStock(apples: 500, appleSeeds: 100)
    var shopAvailableStockPrices = StockPrice(applesPrice: 20, appleSeedsPrice: 5)
        
}
