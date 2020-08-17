//
//  Pokemon.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

struct Type: Codable {
    let slot: Int
    let name: String
}

struct Stat: Codable {
    let name: String
    let baseValue: Int
}

struct Pokemon: Codable {
    let id: Int
    let name: String
    let listingImageURL: URL
    let detailImageURL: URL
    let generation: Int
    let types: [Type]
    let stats: [Stat]
    let height: Double
    let weight: Double
}
