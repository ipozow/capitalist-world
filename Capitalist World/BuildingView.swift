//
//  BuildingView.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 30-01-23.
//

import SwiftUI

struct BuildingView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var player: Player
    let selectedCity: Binding<City>
    let buildings = [Building.house, Building.supermarket]

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding()
                }
            }
            
            VStack {
                ForEach(buildings) { building in
                    VStack {
                        Text(building.type.rawValue)
                        Text("\(building.space, specifier: "%.2f") m²")
                        Button(action: {
                            self.build(building: building)
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text(NSLocalizedString("build", comment: "Construir"))
                                .padding()
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .onTapGesture {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    func build(building: Building) {
        if player.money >= building.cost {
            player.money -= building.cost
            selectedCity.wrappedValue.availableArea -= building.space
            selectedCity.wrappedValue.buildings.append(building)
        }
    }
}
