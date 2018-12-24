//
//  ViewController.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 12/13/18.
//  Copyright © 2018 Pozo. All rights reserved.
//

import UIKit

var dinero = 100 /*: Int {
    UserDefaults.standard.set(dinero, forKey: "dineroActual")
    return dinero
}*/

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func venderTransitionButton(_ sender: UIButton) {
        updateMoney()
    }
    @IBOutlet weak var dineroLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    
    var profit: Double {
        if self.profit < 0 {
            dineroLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }
        return self.profit
    }
    func updateMoney() {
        dineroLabel.text = String(dinero)
    }
    
}
