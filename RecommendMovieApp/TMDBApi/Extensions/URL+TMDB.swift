//
//  URL+TMDB.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 30.06.2025.
//

import Foundation

extension URL {
    static func tmdbImage(path: String?, size: String = "w500") -> URL? {
        guard let path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/\(size)\(path)")
    }
}
