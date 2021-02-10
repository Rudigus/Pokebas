//
//  ListingPresenterTests.swift
//  PokebasTests
//
//  Created by Rodrigo Matos Aguiar on 09/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import XCTest
@testable import Pokebas

class ListingPresenterTests: XCTestCase {

    func test_getPokemonCount_whenDataArrayCountIs3_shouldReturn3() {
        // Given
        let sut = ListingPresenter(delegate: nil)
        sut.dataArray = PokemonMockData().getMockPokemons(pokemonCount: 3)

        // When
        let count = sut.getPokemonCount()

        // Then
        XCTAssertEqual(count, 3)

    }

    func test_getPokemon_whenValidRowProvided_shouldReturnPokemon() {
        // Given
        let sut = ListingPresenter(delegate: nil)
        sut.dataArray = PokemonMockData().getMockPokemons(pokemonCount: 6)

        // When
        let someCellRow = 4
        let pokemon = sut.getPokemon(at: someCellRow)

        // Then
        XCTAssertNotNil(pokemon)
    }

    func test_getPokemon_whenInvalidRowProvided_shouldReturnNil() {
        // Given
        let sut = ListingPresenter(delegate: nil)
        sut.dataArray = PokemonMockData().getMockPokemons(pokemonCount: 2)

        // When
        let someCellRow = 4
        let pokemon = sut.getPokemon(at: someCellRow)

        // Then
        XCTAssertNil(pokemon)
    }

    func test_changePageIfNeeded_whenCollectionViewLastRowProvided_shouldIncreaseCurrentPage() {
        // Given
        let sut = ListingPresenter(delegate: nil)
        sut.dataArray = PokemonMockData().getMockPokemons(pokemonCount: 5)

        // When
        let lastCellRow = 4
        sut.changePageIfNeeded(row: lastCellRow)

        // Then
        XCTAssertEqual(sut.currentPage, 2)
    }

    func test_changePageIfNeeded_whenCollectionViewNotLastRowProvided_shouldNotAlterCurrentPage() {
        // Given
        let sut = ListingPresenter(delegate: nil)
        sut.dataArray = PokemonMockData().getMockPokemons(pokemonCount: 8)

        // When
        let lastCellRow = 5
        sut.changePageIfNeeded(row: lastCellRow)

        // Then
        XCTAssertEqual(sut.currentPage, 1)
    }

}
