//
//  Stat.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

//import Foundation
//
//enum StatEnum: String {
//    case hp, attack, defense, spAttack = "special-attack", spDefense = "special-defense", speed, unknown
//}
//
//extension StatEnum: Codable {
//    public init(from decoder: Decoder) throws {
//        self = try StatEnum(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
//    }
//}
//
//struct StatStruct {
//    let name: StatEnum
//    let baseValue: Int
//
//    enum CodingKeys: String, CodingKey {
//        case baseValue = "base_stat"
//        case statInfo = "stat"
//    }
//
//    enum StatInfo: String, CodingKey {
//        case name
//    }
//
//}
//
//extension StatStruct: Codable {
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        baseValue = try values.decode(Int.self, forKey: .baseValue)
//
//        let statInfo = try values.nestedContainer(keyedBy: StatInfo.self, forKey: .statInfo)
//        name = try statInfo.decode(StatEnum.self, forKey: .name)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(baseValue, forKey: .baseValue)
//
//        var statInfo = container.nestedContainer(keyedBy: StatInfo.self, forKey: .statInfo)
//        try statInfo.encode(name, forKey: .name)
//    }
//
//}
