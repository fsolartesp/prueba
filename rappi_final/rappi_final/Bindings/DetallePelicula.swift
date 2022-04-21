//
//  DetallePelicula.swift
//  prueba_rappi
//
//  Created by fredy on 16/04/22.
//

import SwiftUI

class DetallePelicula: ObservableObject {
    
    private let servicioPelicula: ServicioPelicula
    @Published var pelicula: Pelicula?
    @Published var isLoading = false
    @Published var error: NSError?
    
    init(servicioPelicula: ServicioPelicula = TiendaPelicula.shared) {
        self.servicioPelicula = servicioPelicula
    }
    
    func cargarPelicula(id: Int) {
        self.pelicula = nil
        self.isLoading = false
        self.servicioPelicula.traerPelicula(id: id) {[weak self] (result) in
            guard let self = self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let pelicula):
                self.pelicula = pelicula
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
