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
    let height: Int
    let weight: Int

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

extension Pokemon: Codable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        height = try values.decode(Int.self, forKey: .height)
        weight = try values.decode(Int.self, forKey: .weight)
        types = try values.decode([TypeStruct].self, forKey: .types)
        stats = try values.decode([StatStruct].self, forKey: .stats)

        let sprites = try values.nestedContainer(keyedBy: Sprites.self, forKey: .sprites)
        listingImageURL = try sprites.decode(URL.self, forKey: .listingImageURL)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(height, forKey: .height)
        try container.encode(weight, forKey: .weight)
        try container.encode(types, forKey: .types)
        try container.encode(stats, forKey: .stats)

        var sprites = container.nestedContainer(keyedBy: Sprites.self, forKey: .sprites)
        try sprites.encode(listingImageURL, forKey: .listingImageURL)
    }
}
