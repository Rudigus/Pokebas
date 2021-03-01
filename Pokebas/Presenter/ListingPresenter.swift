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
    var queryMode = false

    private var dataArray: [Pokemon] = [] {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.renderPokemons()
            }
        }
    }

    var currentPage: Int = 1 {
        didSet {
            pokemonRequest(page: currentPage) { pokeArray in
                self.dataArray += pokeArray
            }
        }
    }

    init(delegate: ListingPresenterDelegate?) {
        self.delegate = delegate
    }

    private func pokemonRequest(page: Int, completion: @escaping ([Pokemon]) -> Void) {

        let pokeArray = CoreDataStack.shared.load(pageNumber: page)
        if !pokeArray.isEmpty {
            //print("Fetching from Core Data")
            //print(pokeArray.map { $0.id })
            completion(pokeArray)
        } else {
            //print("Fetching from API")
            let apiController = ApiController()
            apiController.getPokemons(offset: (page - 1) * 20) { pokeArray in
                CoreDataStack.shared.save()
                completion(pokeArray.sorted(by: {$0.id < $1.id}))
            }
        }
    }

//    func getPokeArray(from pokeDict: [Int: Pokemon]) -> [Pokemon] {
//        var pokeArray = Array(pokeDict.values)
//        pokeArray.sort {
//            $0.id < $1.id
//        }
//        return pokeArray
//    }

    func loadPokemons() {
        pokemonRequest(page: currentPage) { pokeArray in
            self.dataArray = pokeArray
        }
    }

    func loadPreviousPagePokemons(forPage page: Int) {
        pokemonRequest(page: page) { pokeArray in
            self.dataArray = pokeArray + self.dataArray
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

    // Changes page for API pagination feature
    // When collection view's last cell row is the last one, you gotta load more pokemons
    func changePageIfNeeded(row: Int) {
        // Row starts at 0, count starts at 1
        if row + 1 == dataArray.count && !queryMode {
            currentPage += 1
        }
    }

    func performPokemonNameQuery(queryString: String) {
        if queryString == "" {
            queryMode = false
            currentPage = 1
            loadPokemons()
        } else {
            queryMode = true
            self.dataArray = CoreDataStack.shared.load(queryString: queryString)
        }
        self.delegate?.scrollCollectionToTop()
    }

}
