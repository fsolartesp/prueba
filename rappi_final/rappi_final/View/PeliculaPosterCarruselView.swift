//
//  PeliculaPosterCarruselView.swift
//  rappi_final
//
//  Created by fredy on 18/04/22.
//

import SwiftUI

struct PeliculaPosterCarruselView: View {
    
    let title: String
    let peliculas: [Pelicula]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.peliculas) { pelicula in
                        NavigationLink(destination: PeliculaDetalleView(peliculaId: pelicula.id)) {
                            PeliculaPosterTarjetaView(pelicula: pelicula)
                        }.buttonStyle(PlainButtonStyle())
                            .padding(.leading, pelicula.id == self.peliculas.first!.id ? 16 : 0)
                            .padding(.trailing, pelicula.id == self.peliculas.last!.id ? 16 : 0)
                    }
                }
            }
        }
        
    }
}

struct PeliculaPosterCarruselView_Previews: PreviewProvider {
    static var previews: some View {
        PeliculaPosterCarruselView(title: "Now Playing", peliculas: Pelicula.subsPeliculas)
    }
}
