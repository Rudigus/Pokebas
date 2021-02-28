//
//  Type+CoreDataClass.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//
//

import Foundation
import CoreData

enum TypeEnum: String {
    case normal, fire, fighting, water, flying, grass, poison, electric, ground,
    psychic, rock, ice, bug, dragon, ghost, dark, steel, fairy, unknown
}

//extension TypeEnum: Codable {
//    public init(from decoder: Decoder) throws {
//        self = try TypeEnum(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
//    }
//}

@objc(Type)
public class Type: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case slot
        case typeInfo = "type"
    }

    enum TypeInfo: String, CodingKey {
        case name
    }

    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        slot = Int64(try values.decode(Int.self, forKey: .slot))

        let typeInfo = try values.nestedContainer(keyedBy: TypeInfo.self, forKey: .typeInfo)
        name = try typeInfo.decode(String.self, forKey: .name)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(slot, forKey: .slot)

        var typeInfo = container.nestedContainer(keyedBy: TypeInfo.self, forKey: .typeInfo)
        try typeInfo.encode(name, forKey: .name)
    }

}
