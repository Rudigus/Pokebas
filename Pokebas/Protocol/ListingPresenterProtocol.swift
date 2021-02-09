//
//  ListingProtocol.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 08/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import Foundation

protocol ListingPresenterProtocol: AnyObject {
    func loadPokemons()
    func getPokemonCount() -> Int
    func getPokemon(at row: Int) -> Pokemon?
    func changePageIfNeeded(row: Int)
}

protocol ListingPresenterDelegate: AnyObject {
    func renderPokemons()
}
