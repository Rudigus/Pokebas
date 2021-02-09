//
//  ListingPresenter.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 08/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import Foundation

class ListingPresenter: ListingPresenterProtocol {

    weak var delegate: ListingPresenterDelegate?

    var dataArray: [Pokemon] = [] {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.renderPokemons()
            }
        }
    }

    var currentPage: Int = 1 {
        didSet {
            pokemonRequest { pokeArray in
                self.dataArray += pokeArray
            }
        }
    }

    init(delegate: ListingPresenterDelegate?) {
        self.delegate = delegate
    }

    func pokemonRequest(completion: @escaping ([Pokemon]) -> Void) {

        var pokeArray: [Pokemon] = []

        let pokebase = Pokebase(pageNumber: currentPage)
        let pokeDict = pokebase.load()
        if !pokeDict.isEmpty {
            pokeArray = getPokeArray(from: pokeDict)
            completion(pokeArray)
        } else {
            let apiController = ApiController()
            apiController.getPokemons(offset: (currentPage - 1) * 20) { pokeDict in
                pokebase.save(pokeDict)
                pokeArray = self.getPokeArray(from: pokeDict)
                completion(pokeArray)
            }
        }
    }

    func getPokeArray(from pokeDict: [Int: Pokemon]) -> [Pokemon] {
        var pokeArray = Array(pokeDict.values)
        pokeArray.sort {
            $0.id < $1.id
        }
        return pokeArray
    }

    func loadPokemons() {
        pokemonRequest { pokeArray in
            self.dataArray = pokeArray
        }
    }

    func getPokemonCount() -> Int {
        return dataArray.count
    }

    func getPokemon(at row: Int) -> Pokemon? {
        if dataArray.indices.contains(row) {
            return dataArray[row]
        } else {
            return nil
        }

    }

    func changePageIfNeeded(row: Int) {
        if row + 1 == dataArray.count {
            currentPage += 1
        }
    }
}
