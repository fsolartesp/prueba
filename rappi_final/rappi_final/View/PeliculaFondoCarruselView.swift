//
//  PeliculaFondoCarruselView.swift
//  rappi_final
//
//  Created by fredy on 17/04/22.
//

import SwiftUI

struct PeliculaFondoCarruselView: View {
    
    let titulo: String
    let peliculas: [Pelicula]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(titulo)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.peliculas) { pelicula in
                        NavigationLink(destination: PeliculaDetalleView(peliculaId: pelicula.id)) {
                            PeliculaFondoTarjetaView(pelicula: pelicula)
                                .frame(width: 272, height: 200)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, pelicula.id == self.peliculas.first!.id ? 16 : 0)
                        .padding(.trailing, pelicula.id == self.peliculas.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct PeliculaFondoCarruselView_Previews: PreviewProvider {
    static var previews: some View {
        PeliculaFondoCarruselView(titulo: "Latest", peliculas: Pelicula.subsPeliculas)
    }
}
