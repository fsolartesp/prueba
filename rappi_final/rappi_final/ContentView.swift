//
//  ContentView.swift
//  rappi_final
//
//  Created by fredy on 19/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            PeliculaListaView()
                .tabItem {
                    VStack{
                        Image(systemName: "tv")
                        Text("Peliculas")
                    }
                }
                .tag(0)
            BuscarPeliculaView()
                .tabItem {
                    VStack{
                    Image(systemName: "magnifyingglass")
                    Text("Buscar")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
