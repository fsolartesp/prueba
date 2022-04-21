//
//  PeliculaDetalleView.swift
//  rappi_final
//
//  Created by fredy on 19/04/22.
//

import SwiftUI

struct PeliculaDetalleView: View {
    
    let peliculaId: Int
    @ObservedObject private var detallePelicula = DetallePelicula()
    
    var body: some View {
        ZStack {
            LoadingView(isLoading: self.detallePelicula.isLoading, error: self.detallePelicula.error) {
                self.detallePelicula.cargarPelicula(id: self.peliculaId)
            }
            
            if detallePelicula.pelicula != nil {
                PeliculaDetalleListView(pelicula: self.detallePelicula.pelicula!)
                
            }
        }
        .navigationBarTitle(detallePelicula.pelicula?.title ?? "")
        .onAppear {
            self.detallePelicula.cargarPelicula(id: self.peliculaId)
        }
    }
}

struct PeliculaDetalleListView: View {
    
    let pelicula: Pelicula
    @State private var selectedTrailer: PeliculaVideo?
    let cargarimagen = CargaImagenes()
    
    var body: some View {
        List {
            PeliculaDetalleImage(cargarimagen: cargarimagen, imageURL: self.pelicula.backdropURL)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            HStack {
                Text(pelicula.genreText)
                Text("·")
                Text(pelicula.yearText)
                Text(pelicula.durationText)
            }
            
            Text(pelicula.overview)
            HStack {
                if !pelicula.ratingText.isEmpty {
                    Text(pelicula.ratingText).foregroundColor(.yellow)
                }
                Text(pelicula.scoreText)
            }
            
            Divider()
            
            HStack(alignment: .top, spacing: 4) {
                if pelicula.cast != nil && pelicula.cast!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Starring").font(.headline)
                        ForEach(self.pelicula.cast!.prefix(9)) { cast in
                            Text(cast.name)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                }
                
                if pelicula.crew != nil && pelicula.crew!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        if pelicula.directors != nil && pelicula.directors!.count > 0 {
                            Text("Director(s)").font(.headline)
                            ForEach(self.pelicula.directors!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                        
                        if pelicula.producers != nil && pelicula.producers!.count > 0 {
                            Text("Producer(s)").font(.headline)
                                .padding(.top)
                            ForEach(self.pelicula.producers!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                        
                        if pelicula.screenWriters != nil && pelicula.screenWriters!.count > 0 {
                            Text("Screenwriter(s)").font(.headline)
                                .padding(.top)
                            ForEach(self.pelicula.screenWriters!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Divider()
            
            if pelicula.youtubeTrailers != nil && pelicula.youtubeTrailers!.count > 0 {
                Text("Trailers").font(.headline)
                
                ForEach(pelicula.youtubeTrailers!) { trailer in
                    Button(action: {
                        self.selectedTrailer = trailer
                    }) {
                        HStack {
                            Text(trailer.name)
                            Spacer()
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color(UIColor.systemBlue))
                        }
                    }
                }
            }
        }
        .sheet(item: self.$selectedTrailer) { trailer in
            SafariView(url: trailer.youtubeURL!)
        }
    }
}

struct PeliculaDetalleImage: View {
    
    @ObservedObject var cargarimagen: CargaImagenes
    let imageURL: URL
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.cargarimagen.image != nil {
                Image(uiImage: self.cargarimagen.image!)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear {
            self.cargarimagen.cargarimagen(with: self.imageURL)
        }
    }
}

struct PeliculaDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PeliculaDetalleView(peliculaId: Pelicula.subsPelicula.id)
        }
    }
}
