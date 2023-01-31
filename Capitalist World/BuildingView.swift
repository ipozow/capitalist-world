//
//  BuildingView.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 30-01-23.
//

import SwiftUI

struct BuildingView: View {
    @EnvironmentObject var city: City
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.city.build(building: .house)
                }) {
                    VStack {
                        Text("Casa")
                        Text("$1000")
                        Text("150 m²")
                    }
                }
                
                Button(action: {
                    self.city.build(building: .supermarket)
                }) {
                    VStack {
                        Text("Supermercado")
                        Text("$175000")
                        Text("2000 m²")
                    }
                }
            }
        }
    }
}

