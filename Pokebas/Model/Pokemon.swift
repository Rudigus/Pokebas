//
//  Pokemon.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

struct Pokemon {
    let id: Int
    let name: String
    let listingImageURL: URL
    //let detailImageURL: URL
    //let generation: Int
    let types: [TypeStruct]
    let stats: [StatStruct]
    let height: Double
    let weight: Double

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case height
        case weight
        case types
        case stats

        case sprites
    }

    enum Sprites: String, CodingKey {
        case listingImageURL = "front_default"
    }

}

extension Pokemon: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        height = (try values.decode(Double.self, forKey: .height)) / 10
        weight = (try values.decode(Double.self, forKey: .weight)) / 10
        types = try values.decode([TypeStruct].self, forKey: .types)
        stats = try values.decode([StatStruct].self, forKey: .stats)

        let sprites = try values.nestedContainer(keyedBy: Sprites.self, forKey: .sprites)
        listingImageURL = try sprites.decode(URL.self, forKey: .listingImageURL)
    }
}
