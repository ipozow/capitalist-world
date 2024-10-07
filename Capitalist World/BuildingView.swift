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
    @Binding var selectedCity: City
    
    let buildings = [Building.createHouse(), Building.createSupermarket()]

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
                            self.selectedCity.build(building: building, player: player)
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
}
