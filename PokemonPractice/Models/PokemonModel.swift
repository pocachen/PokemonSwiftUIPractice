//
//  PokemonModel.swift
//  PokemonPractice
//
//  Created by PocaChen on 2024/10/16.
//

import Foundation

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let height: CGFloat
    let weight: CGFloat
    let types: [PokemonType]
    let sprites: Sprites
    
    var capitalizedName: String {
        return name.prefix(1).uppercased() + name.dropFirst()
    }
    
    var heightString: String {
        return String(format: "%.1fm", height / 10)
    }
    
    var weightString: String {
        return String(format: "%.1fkg", weight / 10)
    }
    
    var idWithHashtag: String {
        return String(format: "#%03d", id)
    }
    
    var pokemonTypes: [String] {
        return types.compactMap({ $0.type.name })
    }
    
    var imageUrl: URL? {
        return sprites.other.home.frontDefaultUrl
    }
}

// MARK: Decodable
extension Pokemon {
    struct PokemonType: Decodable {
        let type: `Type`
    }

    struct `Type`: Decodable {
        let name: String
    }

    struct Sprites: Decodable {
        let other: Other
    }

    struct Other: Decodable {
        let home: Home
    }

    struct Home: Decodable {
        let frontDefaultUrl: URL

        enum CodingKeys: String, CodingKey {
            case frontDefaultUrl = "front_default"
        }
    }
}
