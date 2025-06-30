//
//  MovieListView.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 03.07.2025.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var vm = MovieListViewModel()
    
    var body: some View {
        List(vm.movies) { movie in
            MovieView(movie: movie)
        }
        .task { await vm.loadMovies() }
        .overlay {
            if vm.isLoading { ProgressView() }
        }
    }
}
