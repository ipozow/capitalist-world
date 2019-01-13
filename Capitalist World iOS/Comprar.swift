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
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
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
    
    @IBOutlet weak var userAvailableStockLabel: UILabel!
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let cantidad = sender.text {
            cantidadMultiplier = Int(cantidad)!
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
    
    var cantidadMultiplier = 1
    
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
            applesData.stock += cantidadMultiplier
            ViewController().dinero -= applesData.price * cantidadMultiplier
            ViewController().saveDinero()
            userAvailableStockLabel.text = "\(applesData.stock)"
        } else {
            appleSeedsData.stock += cantidadMultiplier
            ViewController().dinero -= appleSeedsData.price * cantidadMultiplier
            ViewController().saveDinero()
            userAvailableStockLabel.text = "\(appleSeedsData.stock)"
        }
        
        print(ViewController().dinero)
        print(appleSeedsData.stock)
        print(applesData.stock)
    }
    
}
