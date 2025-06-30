//
//  PageWithMovies.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 30.06.2025.
//

import Foundation

struct PageWithMovies: Codable {
    let page: Int
    let totalPages: Int
    let results: [Movie]
}
