//
//  Stat+CoreDataProperties.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//
//

import Foundation
import CoreData

extension Stat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stat> {
        return NSFetchRequest<Stat>(entityName: "Stat")
    }

    @NSManaged public var name: String?
    @NSManaged public var baseValue: Int64
    @NSManaged public var pokemon: Pokemon?

}

extension Stat : Identifiable {

}
