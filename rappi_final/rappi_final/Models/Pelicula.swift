//
//  Pelicula.swift
//  rappi_final
//
//  Created by fredy on 18/04/22.
//

import Foundation

struct PeliculaResponse: Decodable {
    
    let results: [Pelicula]
}


struct Pelicula: Decodable, Identifiable, Hashable {
    static func == (lhs: Pelicula, rhs: Pelicula) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String?
    
    let genres: [PeliculaGenre]?
    let credits: PeliculaCredit?
    let videos: PeliculaVideoResponse?
    
    static private let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    static private let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    var genreText: String {
        genres?.first?.name ?? "n/a"
    }
    
    var ratingText: String {
        let rating = Int(voteAverage)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
    
    var yearText: String {
        guard let releaseDate = self.releaseDate, let date = Utilidades.dateFormatter.date(from: releaseDate) else {
            return "n/a"
        }
        return Pelicula.yearFormatter.string(from: date)
    }
    
    var durationText: String {
        guard let runtime = self.runtime, runtime > 0 else {
            return "n/a"
        }
        return Pelicula.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
    }
    
    var cast: [PeliculaCast]? {
        credits?.cast
    }
    
    var crew: [PeliculaCrew]? {
        credits?.crew
    }
    
    var directors: [PeliculaCrew]? {
        crew?.filter { $0.job.lowercased() == "director" }
    }
    
    var producers: [PeliculaCrew]? {
        crew?.filter { $0.job.lowercased() == "producer" }
    }
    
    var screenWriters: [PeliculaCrew]? {
        crew?.filter { $0.job.lowercased() == "story" }
    }
    
    var youtubeTrailers: [PeliculaVideo]? {
        videos?.results.filter { $0.youtubeURL != nil }
    }
    
}

struct PeliculaGenre: Decodable {
    
    let name: String
}

struct PeliculaCredit: Decodable {
    
    let cast: [PeliculaCast]
    let crew: [PeliculaCrew]
}

struct PeliculaCast: Decodable, Identifiable {
    let id: Int
    let character: String
    let name: String
}

struct PeliculaCrew: Decodable, Identifiable {
    let id: Int
    let job: String
    let name: String
}

struct PeliculaVideoResponse: Decodable {
    
    let results: [PeliculaVideo]
}

struct PeliculaVideo: Decodable, Identifiable {
    
    let id: String
    let key: String
    let name: String
    let site: String
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}

struct lista  : Decodable,Identifiable{
    var id = UUID()
    var nombre: String
    
    
    //return datasource
}








