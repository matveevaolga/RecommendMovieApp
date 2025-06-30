//
//  MovieDetails.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 30.06.2025.
//

import Foundation

struct MovieDetails: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let runtime: Int?
    let genres: [Genre]
    let voteAverage: Double
    
    var duration: String {
        guard let runtime else { return "N/A" }
        return "\(runtime / 60)h \(runtime % 60)m"
    }
}
