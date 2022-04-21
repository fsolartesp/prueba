//
//  BuscarPeliculaView.swift
//  rappi_final
//
//  Created by fredy on 19/04/22.
//

import SwiftUI

struct BuscarPeliculaView: View {
    
    @ObservedObject var buscarPeliculas = BuscarPeliculas()
    
    var body: some View {
        NavigationView {
            List {
                SearchBarView(placeholder: "Buscar Peliculas", text: self.$buscarPeliculas.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                
                LoadingView(isLoading: self.buscarPeliculas.isLoading, error: self.buscarPeliculas.error) {
                    self.buscarPeliculas.buscar(query: self.buscarPeliculas.query)
                }
                
                if self.buscarPeliculas.movies != nil {
                    ForEach(self.buscarPeliculas.movies!) { movie in
                        NavigationLink(destination: PeliculaDetalleView(peliculaId: movie.id)) {
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                Text(movie.yearText)
                            }
                        }
                    }
                }
                
            }
            .onAppear {
                self.buscarPeliculas.startObserve()
            }
            .navigationBarTitle("Buscar")
        }
    }
}

struct BuscarPeliculaView_Previews: PreviewProvider {
    static var previews: some View {
        BuscarPeliculaView()
    }
}
