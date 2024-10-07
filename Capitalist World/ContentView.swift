//
//  ContentView.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 30-01-23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: CityEntity.entity(),
        sortDescriptors: []
    ) var cityEntities: FetchedResults<CityEntity>

    @FetchRequest(
        entity: PlayerEntity.entity(),
        sortDescriptors: []
    ) var playerEntities: FetchedResults<PlayerEntity>
        
    @StateObject var player: PlayerModel
    @State private var cities: [CityModel] = []
    @State private var selectedCityIndex: Int = 0
    
    @State private var showBuildingView = false
    
    init() {
        // Cargar el jugador desde CoreData o crear uno nuevo si no existe
        if let existingPlayerEntity = playerEntities.first {
            // Cargar el dinero del jugador desde CoreData
            _player = StateObject(wrappedValue: PlayerModel(money: existingPlayerEntity.money))
        } else {
            // Crear un nuevo jugador y una nueva entidad en CoreData
            let newPlayer = PlayerModel(money: 5000)
            _player = StateObject(wrappedValue: newPlayer)

            // Crear una nueva entidad PlayerEntity y asignar el valor de dinero
            let playerEntity = PlayerEntity(context: viewContext)
            playerEntity.money = newPlayer.money
            
            // Guardar el contexto de CoreData para persistir el nuevo jugador
            PersistenceController.shared.saveContext()
        }

            // Cargar las ciudades desde CoreData o utilizar las predefinidas si no hay ninguna
            var loadedCities: [CityEntity] = []
            for cityEntity in cityEntities {
                let city = City(
                    name: cityEntity.name ?? "Unknown",
                    population: Int(cityEntity.population),
                    purchasingPowerIndex: cityEntity.purchasingPowerIndex,
                    area: cityEntity.area,
                    buildableArea: cityEntity.buildableArea
                )
                city.availableArea = cityEntity.availableArea
                loadedCities.append(city)
            }

            if loadedCities.isEmpty {
                self.cities = CityData.allCases
            } else {
                self.cities = loadedCities
            }
        }

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
                ForEach(cities[selectedCityIndex].buildings, id: \.id) { building in
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

