//
//  ViewController.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 12/13/18.
//  Copyright © 2018 Pozo. All rights reserved.
//

import UIKit

//
//var dinero = 100
///*: Int {
//    UserDefaults.standard.set(dinero, forKey: "dineroActual")
//    return dinero
//}*/

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func venderTransitionButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var dineroLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    
}
