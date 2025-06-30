//
//  RecommendMovieAppApp.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 28.06.2025.
//

import SwiftUI

@main
struct RecommendMovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            SingleMovieView()
        }
    }
}

struct SingleMovieView: View {
    @State private var movie: Movie?
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            } else if let movie = movie {
                VStack(spacing: 16) {
                    if let url = movie.posterURL {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 300)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    Text(movie.title)
                        .font(.title)
                        .padding()
                    
                    Text(movie.overview ?? "No description available")
                        .padding()
                }
            } else {
                Text("Failed to load movie")
                    .foregroundColor(.red)
            }
        }
        .task {
            await loadFirstMovie()
        }
    }
    
    private func loadFirstMovie() async {
        do {
            let page = try await TMDBApiManager.shared.fetchMovies(page: 1)
            movie = page.results.first // Берем только первый фильм
        } catch {
            print("Error loading movie:", error.localizedDescription)
        }
        isLoading = false
    }
}
