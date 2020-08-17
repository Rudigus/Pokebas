//
//  Type.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

enum TypeEnum: String {
    case normal, fire, fighting, water, flying, grass, poison, electric, ground,
    psychic, rock, ice, bug, dragon, ghost, dark, steel, fairy, unknown
}

extension TypeEnum: Codable {
    public init(from decoder: Decoder) throws {
        self = try TypeEnum(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

struct TypeStruct {
    let slot: Int
    let name: TypeEnum

    enum CodingKeys: String, CodingKey {
        case slot
        case typeInfo = "type"
    }

    enum TypeInfo: String, CodingKey {
        case name
    }

}

extension TypeStruct: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        slot = try values.decode(Int.self, forKey: .slot)

        let typeInfo = try values.nestedContainer(keyedBy: TypeInfo.self, forKey: .typeInfo)
        name = try typeInfo.decode(TypeEnum.self, forKey: .name)
    }
}
