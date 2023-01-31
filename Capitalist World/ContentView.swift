//
//  ContentView.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 30-01-23.
//

import SwiftUI



struct ContentView: View {
    @State var money: Double = 0
    @State var selectedCityIndex: Int = 0
    @State private var showBuildingView = false

    let cities: [City] = [
        City(name: "Nueva York", population: 8336697, purchasingPowerIndex: 0.849, area: 783800.0, buildableArea: 300000.0),
        City(name: "Los Ángeles", population: 3990456, purchasingPowerIndex: 0.844, area: 1046200.0, buildableArea: 200000.0),
        City(name: "Chicago", population: 2705994, purchasingPowerIndex: 0.834, area: 606100.0, buildableArea: 150000.0)
    ]
    
    var body: some View {
        VStack {
            Text("Dinero: $\(money, specifier: "%.2f")")
                .font(.title)
            
            Picker(selection: $selectedCityIndex, label: Text("Ciudad")) {
                ForEach(0..<cities.count) { index in
                    Text(self.cities[index].name)
                }.frame(width: 150)
            }
            
            if cities.indices.contains(selectedCityIndex) {
                Text("Ciudad seleccionada: \(cities[selectedCityIndex].name)")
                    .font(.body)
                
                Text("Población de la ciudad: \(cities[selectedCityIndex].population)")
                    .font(.body)
                
                Text("Área disponible para construir: \(cities[selectedCityIndex].buildableArea, specifier: "%.2f") m²")
                    .font(.body)
            } else {
                Text("No hay ciudad seleccionada")
                    .font(.body)
            }
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
            BuildingView()
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
