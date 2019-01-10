//
//  ViewController.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 12/13/18.
//  Copyright © 2018 Pozo. All rights reserved.
//

import UIKit
//Por hacer: que al agregar dinero no se reinicie el dinero a este valor var dinero: Int
//var dinero = 100

var dineroShared = ViewController()


class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let totalBalance = "totalBalance"
    }
   
    var dinero = 100
    
    @IBAction func testButton(_ sender: UIButton) {
        dinero += 10
        saveDinero()
        checkSavedDinero()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkSavedDinero()
    }
    
    @IBAction func venderTransitionButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var dineroLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    
    func saveDinero() {
        defaults.set(dinero, forKey: Keys.totalBalance)
        dinero = defaults.integer(forKey: Keys.totalBalance)
    }
    func checkSavedDinero() {
        
        dineroLabel.text = "\(dinero)"
    }
    
}
