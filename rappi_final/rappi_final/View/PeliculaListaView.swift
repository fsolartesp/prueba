//
//  PeliculaListaView.swift
//  rappi_final
//
//  Created by fredy on 19/04/22.
//

import SwiftUI

struct PeliculaListaView: View {
    
    @ObservedObject private var nowPlayingState = ListaPelicula()
    @ObservedObject private var upcomingState = ListaPelicula()
    @ObservedObject private var topRatedState = ListaPelicula()
    @ObservedObject private var popularState = ListaPelicula()
    
    var body: some View {
        NavigationView {
            List {
                
                Group {
                    if nowPlayingState.peliculas != nil {
                        PeliculaPosterCarruselView(title: "Now Playing", peliculas: nowPlayingState.peliculas!)
                        
                    } else {
                        LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                            self.nowPlayingState.cargarPeliculas(with: .nowPlaying)
                        }
                    }
                    
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                Group {
                    if upcomingState.peliculas != nil {
                        PeliculaFondoCarruselView(titulo: "Upcoming", peliculas: upcomingState.peliculas!)
                    } else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            self.upcomingState.cargarPeliculas(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                
                
                Group {
                    if topRatedState.peliculas != nil {
                        PeliculaFondoCarruselView(titulo: "Top Rated", peliculas: topRatedState.peliculas!)
                        
                    } else {
                        LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                            self.topRatedState.cargarPeliculas(with: .topRated)
                        }
                    }
                    
                    
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                
                Group {
                    if popularState.peliculas != nil {
                        PeliculaFondoCarruselView(titulo: "Popular", peliculas: popularState.peliculas!)
                        
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            self.popularState.cargarPeliculas(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                
                
                
            }
            .navigationBarTitle("Prueba Rappi")
        }
        .onAppear {
            self.nowPlayingState.cargarPeliculas(with: .nowPlaying)
            self.upcomingState.cargarPeliculas(with: .upcoming)
            self.topRatedState.cargarPeliculas(with: .topRated)
            self.popularState.cargarPeliculas(with: .popular)
        }
        
    }
}

struct PeliculaListaViewPreviews: PreviewProvider {
    static var previews: some View {
        PeliculaListaView()
    }
}

