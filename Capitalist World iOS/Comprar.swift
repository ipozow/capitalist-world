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
        UIImage(named: "seeds")!,
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
            cantidadMultiplier = cantidad
            print(cantidadMultiplier)
        }
    }
    @IBOutlet weak var cantidadTextField: UITextField!
    
    @IBAction func textFieldTouchUpOutside(_ sender: UITextField) {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
    
    var cantidadMultiplier = "" //por hacer: cantidadMultipier debe ser un Int
    
    var applesData = ApplesStock(stock: 0, price: 10)
    var appleSeedsData = AppleSeedsStock(stock: 0, price: 5)
    
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let totalStock = "totalStock"
    }
    
    func saveStockWhenBuying() {
        defaults.set(applesData.stock, forKey: Keys.totalStock)
        defaults.set(appleSeedsData.stock, forKey: Keys.totalStock)
    }
    
    @IBAction func productButtonTapped(_ sender: UIButton) {
        if products.count == 0 {
            applesData.stock += 1//cantidadMultiplier
            ViewController().dinero -= applesData.price * 1 //cantidadMultiplier
        } else {
            appleSeedsData.stock += 1 //cantidadMultiplier
            ViewController().dinero -= appleSeedsData.price * 1 //cantidadMultiplier
        }
        userAvailableStockLabel.text = "\(applesData.stock)"
        print(ViewController().dinero)
        print(appleSeedsData.stock)
        print(applesData.stock)
    }
    
}
