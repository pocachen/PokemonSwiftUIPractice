//
//  APIManager.swift
//  PokemonPractice
//
//  Created by PocaChen on 2024/10/16.
//

import Foundation

final class APIManager {
    static let shared = APIManager()
    private init() {}
}


extension APIManager {
    
    enum APIError: Error {
        case invalidURL
        case requestFailed
        case decodingFailed
        
        var errMessage: String {
            switch self {
            case .invalidURL:
                return "invalidURL"
            case .requestFailed:
                return "requestFailed"
            case .decodingFailed:
                return "decodingFailed"
            }
        }
    }
 
    func fetchPokemonData(value: String) async throws -> Pokemon {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(value)") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.requestFailed
        }
        
        let decoder = JSONDecoder()
        do {
            let pokemon = try decoder.decode(Pokemon.self, from: data)
            return pokemon
        } catch {
            throw APIError.decodingFailed
        }
    }
}
