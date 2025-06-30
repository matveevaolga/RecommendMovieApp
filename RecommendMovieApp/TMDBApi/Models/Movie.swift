//
//  Movie.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 30.06.2025.
//

import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let genreIds: [Int]?
    let voteAverage: Double
    
    var posterURL: URL? {
        guard let posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
    
    var releaseYear: String {
        guard let dateString = releaseDate else { return "" }
        return String(dateString.prefix(4))
    }
}
