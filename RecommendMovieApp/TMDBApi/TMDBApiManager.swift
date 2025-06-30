//
//  TMDBApiManager.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 30.06.2025.
//

import Foundation
import KeychainSwift

final class TMDBApiManager {
    static let shared = TMDBApiManager()
    private init() {}
    
    private let keychain = KeychainSwift()
    private let baseURL = "https://api.themoviedb.org/3"
    private let jsonDecoder = JSONDecoder()
    
    // MARK: - Configuration
    private var apiKey: String {
        if let savedKey = keychain.get("API_KEY") {
            return savedKey
        }
        
        let bundleKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
        if !bundleKey.isEmpty {
            keychain.set(bundleKey, forKey: "API_KEY", withAccess: .accessibleWhenUnlocked)
        }
        return bundleKey
    }
    
    // MARK: - Public Methods
    func fetchMovies(page: Int, sortBy: SortingParameter = .popularity) async throws -> PageWithMovies {
        let endpoint = "/discover/movie?language=en&page=\(page)&sort_by=\(sortBy.rawValue)"
        return try await performRequest(endpoint: endpoint)
    }
    
    func fetchMovieDetails(movieId: Int) async throws -> MovieDetails {
        let endpoint = "/movie/\(movieId)"
        return try await performRequest(endpoint: endpoint)
    }
    
    // MARK: - Private
    private func performRequest<T: Decodable>(endpoint: String) async throws -> T {
        guard let url = URL(string: baseURL + endpoint + "&api_key=\(apiKey)") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }
}
