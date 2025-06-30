//
//  SortingOptions.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 30.06.2025.
//

enum SortingParameter: String, CaseIterable {
    case popularity = "popularity.desc"
    case releaseDate = "primary_release_date.desc"
    case voteAverage = "vote_average.desc"
    
    var displayName: String {
        switch self {
        case .popularity: return "Popularity"
        case .releaseDate: return "Release Date"
        case .voteAverage: return "Rating"
        }
    }
}
