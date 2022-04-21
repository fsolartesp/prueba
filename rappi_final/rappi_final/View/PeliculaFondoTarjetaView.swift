//
//  MovieBackdropCard.swift
//  rappi_final
//
//  Created by fredy on 18/04/22.
//

import SwiftUI

struct PeliculaFondoTarjetaView: View {
    
    let pelicula: Pelicula
    @ObservedObject var cargaImagenes = CargaImagenes()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.cargaImagenes.image != nil {
                    Image(uiImage: self.cargaImagenes.image!)
                    .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            
            Text(pelicula.title)
        }
        .lineLimit(1)
        .onAppear {
            self.cargaImagenes.cargarimagen(with: self.pelicula.backdropURL)
        }
    }
}

struct PeliculaFondoTarjetaView_Previews: PreviewProvider {
    static var previews: some View {
        PeliculaFondoTarjetaView(pelicula: Pelicula.subsPelicula)
    }
}
