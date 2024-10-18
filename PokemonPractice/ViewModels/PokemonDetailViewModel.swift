//
//  PokemonDetailViewModel.swift
//  PokemonPractice
//
//  Created by PocaChen on 2024/10/16.
//

import Foundation
import Combine

class PokemonDetailViewModel: ObservableObject {
    let apiManager = APIManager.shared
    @Published var pokemon: Pokemon?
    @Published var errorMessage: String?   // 若錯誤可回傳給View顯示
   
    init() {
        fetchPokemon(name: "pikachu")
    }
    
    func fetchPokemon(name: String) {
        debugPrint("start fetchPokemon data")
        Task { @MainActor in
            do {
                self.pokemon = try await apiManager.fetchPokemonData(value: name)
                debugPrint("fetchPokemon data success")
            } catch let error as APIManager.APIError {
                self.errorMessage = error.errMessage
                debugPrint("fetchPokemon error: \(error)")
            } catch {
                self.errorMessage = "unexpected error: \(error.localizedDescription)"
                debugPrint("fetchPokemon unexpected error: \(error)")
            }
        }
    }
}
