//
//  ServicioPelicula.swift
//  rappi_final
//
//  Created by fredy on 13/04/22.
//

import Foundation
protocol ServicioPelicula {
    
    func traerPeliculas(from endpoint: PeliculaListatEndpoint, completion: @escaping (Result<PeliculaResponse, PeliculaError>) -> ())
    func traerPelicula(id: Int, completion: @escaping (Result<Pelicula, PeliculaError>) -> ())
    func buscarPelicula(query: String, completion: @escaping (Result<PeliculaResponse, PeliculaError>) -> ())//searchMovie
}

enum PeliculaListatEndpoint: String, CaseIterable, Identifiable {
    
    var id: String { rawValue }
    
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description: String {
        switch self {
            case .nowPlaying: return "Now Playing"
            case .upcoming: return "Upcoming"
            case .topRated: return "Top Rated"
            case .popular: return "Popular"
        }
    }
}

enum PeliculaError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Error Buscar Datos"
        case .invalidEndpoint: return "Error Endpoint"
        case .invalidResponse: return "Error Response"
        case .noData: return "Sin Datos"
        case .serializationError: return "Error Serializacion Datos"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}
