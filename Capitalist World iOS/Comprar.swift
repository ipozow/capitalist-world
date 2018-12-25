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

    
    var shopAvailableStock = AvailableStock(apples: 500, appleSeeds: 100)
    var shopAvailableStockPrices = StockPrice(applesPrice: 20, appleSeedsPrice: 5)
    
   
    
}
