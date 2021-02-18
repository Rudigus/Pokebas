//
//  Pokemon+CoreDataClass.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Pokemon)
public class Pokemon: NSManagedObject, Codable {

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

    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try Int64(values.decode(Int.self, forKey: .id))
        name = try values.decode(String.self, forKey: .name)
        height = try Int64(values.decode(Int.self, forKey: .height))
        weight = try Int64(values.decode(Int.self, forKey: .weight))
        types = try values.decode(Set<Type>.self, forKey: .types)
        stats = try values.decode(Set<Stat>.self, forKey: .stats)

        let sprites = try values.nestedContainer(keyedBy: Sprites.self, forKey: .sprites)
        listingImageURL = try sprites.decode(URL.self, forKey: .listingImageURL)
    }

    public func encode(to encoder: Encoder) throws {
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
