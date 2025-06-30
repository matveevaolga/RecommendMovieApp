//
//  MovieListViewViewModel.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 03.07.2025.
//

import Foundation

final class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let apiManager = TMDBApiManager.shared
    
    func loadMovies() async {
        isLoading = true
        do {
            let page = try await apiManager.fetchMovies(page: 1)
            movies = page.results
        } catch {
            self.error = error
        }
        isLoading = false
    }
}
