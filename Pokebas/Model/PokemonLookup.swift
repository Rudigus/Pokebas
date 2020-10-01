//
//  PokemonLookup.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 18/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

// MARK: - PokemonLookup
struct PokemonLookup: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let url: URL
}
