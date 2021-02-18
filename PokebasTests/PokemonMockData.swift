//
//  PokemonMockData.swift
//  PokebasTests
//
//  Created by Rodrigo Matos Aguiar on 10/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import Foundation

@testable import Pokebas

class PokemonMockData {

    func getMockPokemons(pokemonCount: Int) -> [Pokemon] {
        let mockPokemon: [Pokemon] = []
//        for _ in 1...pokemonCount {
//            mockPokemon.append(
//                Pokemon(id: 18, name: "pidgeot", listingImageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/18.png")!, types: [TypeStruct(slot: 0, name: .fire), TypeStruct(slot: 1, name: .water)], stats: [StatStruct(name: .attack, baseValue: 50)], height: 200, weight: 500)
//            )
//        }
        return mockPokemon
    }

}
