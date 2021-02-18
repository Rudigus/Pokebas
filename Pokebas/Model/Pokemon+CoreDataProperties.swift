//
//  Pokemon+CoreDataProperties.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//
//

import Foundation
import CoreData

extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var height: Int64
    @NSManaged public var id: Int64
    @NSManaged public var listingImageURL: URL?
    @NSManaged public var name: String?
    @NSManaged public var weight: Int64
    @NSManaged public var stats: Set<Stat>
    @NSManaged public var types: Set<Type>

}

// MARK: Generated accessors for stats
extension Pokemon {

    @objc(addStatsObject:)
    @NSManaged public func addToStats(_ value: Stat)

    @objc(removeStatsObject:)
    @NSManaged public func removeFromStats(_ value: Stat)

    @objc(addStats:)
    @NSManaged public func addToStats(_ values: NSSet)

    @objc(removeStats:)
    @NSManaged public func removeFromStats(_ values: NSSet)

}

// MARK: Generated accessors for types
extension Pokemon {

    @objc(addTypesObject:)
    @NSManaged public func addToTypes(_ value: Type)

    @objc(removeTypesObject:)
    @NSManaged public func removeFromTypes(_ value: Type)

    @objc(addTypes:)
    @NSManaged public func addToTypes(_ values: NSSet)

    @objc(removeTypes:)
    @NSManaged public func removeFromTypes(_ values: NSSet)

}

extension Pokemon : Identifiable {

}
