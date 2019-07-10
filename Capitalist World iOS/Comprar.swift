//
//  Comprar.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 12/21/18.
//  Copyright © 2018 Pozo. All rights reserved.
//

import Foundation
import UIKit

var applesData = ApplesStock(stock: 0, price: 10)
var appleSeedsData = AppleSeedsStock(stock: 0, price: 5)

class Comprar: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //gestos para volver al ViewController
    
    //
    @IBOutlet weak var collectionView: UICollectionView!
    
    let products = ["apple", "seeds", "wheat", "wheatSeeds"]
    
    let productImages: [UIImage] = [
        UIImage(named: "apple")!,
        UIImage(named: "seeds")!,
        UIImage(named: "wheat")!,
        UIImage(named: "wheatSeeds")!,
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.productImageView.image = productImages[indexPath.item]
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        var layout = self.collectionView as! UICollectionViewFlowLayout
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//    }
    
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
    
  
    
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let totalStock = "totalStock"
    }
    
    func saveStockWhenBuying() {
        defaults.set(applesData.stock, forKey: Keys.totalStock)
        defaults.set(appleSeedsData.stock, forKey: Keys.totalStock)
    }
    

    
    @IBAction func productButtonTapped(_ sender: UIButton) {
        for product in products {

            if product == "apple" {
                if dinero >= (applesData.price * cantidadMultiplier) {
                    applesData.stock += cantidadMultiplier
                    dinero -= applesData.price * cantidadMultiplier
                    saveDinero()
                    userAvailableStockLabel.text = "\(applesData.stock)"
                    print("apple")
                    break
                } else {
                    let alert = UIAlertController(title: "Dinero insuficiente", message: "Necesitas $ \((applesData.price * cantidadMultiplier) - dinero) para comprar esto", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }

            } else if product == "testtwo" {
                if dinero >= (appleSeedsData.price * cantidadMultiplier) {
                    appleSeedsData.stock += cantidadMultiplier
                    dinero -= appleSeedsData.price * cantidadMultiplier
                    saveDinero()
                    userAvailableStockLabel.text = "\(appleSeedsData.stock)"
                    print("seeds")
                } else {
                    let alert = UIAlertController(title: "Dinero insuficiente", message: "Necesitas $ \((appleSeedsData.price * cantidadMultiplier) - dinero) para comprar esto", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    
        print(dinero)
        print(appleSeedsData.stock)
        print(applesData.stock)
    }
    
}

