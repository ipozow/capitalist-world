//
//  Comprar.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 12/21/18.
//  Copyright © 2018 Pozo. All rights reserved.
//

import Foundation
import UIKit

class Comprar: UIViewController {
    
    //gestos para volver al ViewController
    
    //
    
    @IBOutlet weak var collectionView: UICollectionView!
    //todavía no veo lo de las collectionviews :(
    //var collectionViewObjects = UICollectionViewCell()
    
    @IBOutlet weak var userAvailableStockLabel: UILabel!
    
    var shopAvailableStock = AvailableStock(apples: 500, appleSeeds: 100)
    
    @IBAction func buyApplesButton(_ sender: UIButton) {
        userAvailableStockLabel.text = userAvailableStockLabel.text! + String(10)
        shopAvailableStock.apples -= 10
    }
    
}
