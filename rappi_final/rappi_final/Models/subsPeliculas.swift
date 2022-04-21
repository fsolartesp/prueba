//
//  subsPeliculas.swift
//  rappi_final
//
//  Created by fredy on 18/04/22.
//

import Foundation


extension Pelicula {
    
    static var subsPeliculas: [Pelicula] {
        let response: PeliculaResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
        return response!.results
    }
    
    static var subsPelicula: Pelicula {
        subsPeliculas[0]
    }
    
}

extension Bundle {
    
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utilidades.jsonDecoder
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
}
