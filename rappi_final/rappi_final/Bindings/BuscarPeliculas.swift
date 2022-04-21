//
//  MovieSearBuscarPeliculas.swift
//  rappi_final
//
//  Created by fredy on 16/04/22.
//

import SwiftUI
import Combine
import Foundation

class BuscarPeliculas: ObservableObject {
    
    @Published var query = ""
    @Published var movies: [Pelicula]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    private var subscriptionToken: AnyCancellable?
    
    let servicioPelicula: ServicioPelicula
    
    var isVacioResults: Bool {
        !self.query.isEmpty && self.movies != nil && self.movies!.isEmpty
    }
    
    init(servicioPelicula: ServicioPelicula = TiendaPelicula.shared) {
        self.servicioPelicula = servicioPelicula
    }
    
    func startObserve() {
        guard subscriptionToken == nil else { return }
        
        self.subscriptionToken = self.$query
            .map { [weak self] text in
                self?.movies = nil
                self?.error = nil
                return text
                
        }.throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .sink { [weak self] in self?.buscar(query: $0) }
    }
    
    func buscar(query: String) {
        self.movies = nil
        self.isLoading = false
        self.error = nil
        
        guard !query.isEmpty else {
            return
        }
        
        self.isLoading = true
        self.servicioPelicula.buscarPelicula(query: query) {[weak self] (result) in
            guard let self = self, self.query == query else { return }
            
            self.isLoading = false
            switch result {
            case .success(let response):
                self.movies = response.results
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
    deinit {
        self.subscriptionToken?.cancel()
        self.subscriptionToken = nil
    }
}
