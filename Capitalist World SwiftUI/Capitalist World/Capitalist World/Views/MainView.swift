//
//  ContentView.swift
//  Capitalist World
//
//  Created by Ignacio Pozo on 10-07-19.
//  Copyright © 2019 Ignacio Pozo. All rights reserved.
//


import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Importar")
                    }
                    .padding()
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Exportar")
                }
                .padding()
            }
            .padding()
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Construir")
                }
                .padding()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Rectangle()
                        .frame(width: 200.0, height: 100.0)
                        .cornerRadius(12)
                            Text("Administrar construcciones")
                }
                .padding()
            }
            .padding()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
