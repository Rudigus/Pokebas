//
//  StringTests.swift
//  PokebasTests
//
//  Created by Rodrigo Matos Aguiar on 25/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import XCTest
@testable import Pokebas

class StringTests: XCTestCase {

    func testString_WhenStringProvided_StringShouldHaveCapitalizedFirstLetter() {
        // given
        let sut: String = "palavra"

        // When
        let output = sut.capitalizingFirstLetter()

        // Then
        XCTAssertEqual(output, "Palavra")
    }

}
