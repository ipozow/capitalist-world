//
//  ConstruccionesDelJugador.swift
//  Capitalist World iOS
//
//  Created by Ignacio Pozo Wandersleben on 1/6/19.
//  Copyright © 2019 Pozo. All rights reserved.
//

import Foundation
import UIKit

class ConstruccionesDelJugador: UIViewController {
    var tiendas = ["",]
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func seleccionarButtonTapped(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
}

extension ConstruccionesDelJugador: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tiendas.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tiendas[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //al seleccionar la construcción, cambiar de vista
    }
}
