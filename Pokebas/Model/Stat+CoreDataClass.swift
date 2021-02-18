//
//  Stat+CoreDataClass.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//
//

import Foundation
import CoreData

//enum StatEnum: String {
//    case hp, attack, defense, spAttack = "special-attack", spDefense = "special-defense", speed, unknown
//}
//
//extension StatEnum: Codable {
//    public init(from decoder: Decoder) throws {
//        self = try StatEnum(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
//    }
//}

@objc(Stat)
public class Stat: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case baseValue = "base_stat"
        case statInfo = "stat"
    }

    enum StatInfo: String, CodingKey {
        case name
    }

    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        baseValue = Int64(try values.decode(Int.self, forKey: .baseValue))

        let statInfo = try values.nestedContainer(keyedBy: StatInfo.self, forKey: .statInfo)
        name = try statInfo.decode(String.self, forKey: .name)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(baseValue, forKey: .baseValue)

        var statInfo = container.nestedContainer(keyedBy: StatInfo.self, forKey: .statInfo)
        try statInfo.encode(name, forKey: .name)
    }

}
