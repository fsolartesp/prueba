//
//  PeliculaPosterTarjetaView.swift
//  rappi_final
//
//  Created by fredy on 18/04/22.
//

import SwiftUI

struct PeliculaPosterTarjetaView: View {
    
    let pelicula: Pelicula
    @ObservedObject var cargaImagenes = CargaImagenes()
    
    var body: some View {
        ZStack {
            if self.cargaImagenes.image != nil {
                Image(uiImage: self.cargaImagenes.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
                Text(pelicula.title)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 204, height: 306)
        .onAppear {
            self.cargaImagenes.cargarimagen(with: self.pelicula.posterURL)
        }
    }
}

struct PeliculaPosterTarjetaView_Previews: PreviewProvider {
    static var previews: some View {
        PeliculaPosterTarjetaView(pelicula: Pelicula.subsPelicula)
    }
}
