//
//  ContentView.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 30-01-23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    private let persistenceController = PersistenceController.shared
    
    @StateObject var player = Player(money: 5000)
    @State private var showBuildingView = false

    @State private var cities = CityData.allCases
    @State private var selectedCityIndex: Int = 0
    
    var selectedCityBinding: Binding<City> {
        Binding<City>(
            get: { self.cities[selectedCityIndex] },
            set: { self.cities[selectedCityIndex] = $0 }
        )
    }

    var body: some View {
        VStack {
            Text("Dinero: $\(player.money, specifier: "%.2f")")
                .font(.title)
            
            Picker(selection: $selectedCityIndex, label: Text("Ciudad")) {
                ForEach(cities.indices, id: \.self) { index in
                    Text(cities[index].name).tag(index)
                }
            }
            
            Text("Ciudad seleccionada: \(cities[selectedCityIndex].name)")
                .font(.body)
            
            Text("\(NSLocalizedString("cityPopulation", comment: "")): \(cities[selectedCityIndex].population)")
                .font(.body)
            
            Text("\(NSLocalizedString("cityBuildableArea", comment: "")): \(cities[selectedCityIndex].availableArea, specifier: "%.2f") m²")
                .font(.body)
            
        }
        VStack {
            // Botón para construir distintas estructuras

            Button(action: {
                self.showBuildingView.toggle()
            }) {
                Image(systemName: "plus")
                    .imageScale(.large)
                    .foregroundColor(.blue)
            }
        }.sheet(isPresented: $showBuildingView) {
            BuildingView(player: player, selectedCity: selectedCityBinding)
        }

        if cities.indices.contains(selectedCityIndex) {
            HStack {
                ForEach(cities[selectedCityIndex].buildings, id: \.type) { building in
                    VStack {
                        Text(building.type.rawValue)
                        Text("\(building.space, specifier: "%.2f") m²")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

