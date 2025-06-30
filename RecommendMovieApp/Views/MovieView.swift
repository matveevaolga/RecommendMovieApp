//
//  MovieView.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 03.07.2025.
//

import SwiftUI

struct MovieView: View {
    @State var movie: Movie?
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                if let url = movie!.posterURL {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text(movie!.title)
                    .font(.title)
                    .padding()
                
                Text(movie!.overview ?? "No description available")
                    .padding()
            }
        }
    }
}

