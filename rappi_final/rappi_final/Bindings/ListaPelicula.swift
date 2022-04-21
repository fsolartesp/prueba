//
//  ListaPelicula.swift
//  rappi_final
//
//  Created by fredy on 16/04/22.
//

import SwiftUI

class ListaPelicula: ObservableObject {
    
    @Published var peliculas: [Pelicula]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let servicioPelicula: ServicioPelicula
    
    init(servicioPelicula: ServicioPelicula = TiendaPelicula.shared) {
        self.servicioPelicula = servicioPelicula
    }
    
    func cargarPeliculas(with endpoint: PeliculaListatEndpoint) {
        self.peliculas = nil
        self.isLoading = true
        self.servicioPelicula.traerPeliculas(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.peliculas = response.results
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
}

