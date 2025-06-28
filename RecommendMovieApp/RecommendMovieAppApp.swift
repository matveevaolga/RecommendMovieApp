//
//  RecommendMovieAppApp.swift
//  RecommendMovieApp
//
//  Created by Olga Matveeva on 28.06.2025.
//

import SwiftUI
import KeychainSwift

class APIManager {
    let keychain = KeychainSwift()
    let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? "not found"
    init() {
    }
    func setApiKey() {
        if keychain.get("API_KEY") == nil {
            keychain.set(apiKey, forKey: "API_KEY")
        }
    }
}

@main
struct RecommendMovieAppApp: App {
    let apiManager = APIManager()
    var body: some Scene {
        WindowGroup {
            Text(apiManager.apiKey)
        }
    }
}
