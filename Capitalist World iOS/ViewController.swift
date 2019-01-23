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

var dinero = 100
var revenue = 0

let defaults = UserDefaults.standard

struct Keys {
    static let totalBalance = "totalBalance"
}

func saveDinero() {
    defaults.set(dinero, forKey: Keys.totalBalance)
    dinero = defaults.integer(forKey: Keys.totalBalance)
}

class ViewController: UIViewController {
    
    @IBAction func testButton(_ sender: UIButton) {
        dinero += 1000
        saveDinero()
        checkSavedDinero()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkSavedDinero()
        revenueLabel.labelStyle()
        másEstadísticasLabel.labelStyle()
        dineroLabel.labelStyle()
        administrarConstruccionesButton.buttonStyle()
        construirButton.buttonStyle()
        exportarButton.buttonStyle()
        importarButton.buttonStyle()

        setRevenue(amount: 5)
        startRevenue() // <---- Esto hace la magia que
    }
    
    @IBAction func venderTransitionButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var dineroLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var másEstadísticasLabel: UILabel!
    
    //botones importar, exportar, construir, administrar construcciones
    @IBOutlet weak var administrarConstruccionesButton: UIButton!
    @IBOutlet weak var construirButton: UIButton!
    @IBOutlet weak var exportarButton: UIButton!
    @IBOutlet weak var importarButton: UIButton!
    
    func checkSavedDinero() {
        dineroLabel.text = "\(dinero)"
    }

    func setRevenue(amount: Int) {
        revenue = amount
        revenueLabel.text = "\(amount)"
    }

    func startRevenue() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
            self.updateDinero()
        }
    }

    func updateDinero() {
        dinero += revenue
        saveDinero()
        checkSavedDinero()
    }
    
}

extension UILabel {
    func labelStyle() {
        self.layer.masksToBounds = true;
        self.layer.cornerRadius = 12
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
    static func createCustomLabel() -> UILabel {
        let label = UILabel()
        label.labelStyle()
        return label
    }
}

extension UIButton {
    func buttonStyle() {
        self.titleLabel?.textAlignment = .center
        self.layer.masksToBounds = true;
        self.layer.cornerRadius = 12
    }
    
    static func createCustomButton() -> UIButton {
        let button = UIButton()
        button.buttonStyle()
        return button
    }
}
