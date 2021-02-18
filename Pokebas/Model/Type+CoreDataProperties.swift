//
//  Type+CoreDataProperties.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//
//

import Foundation
import CoreData

extension Type {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Type> {
        return NSFetchRequest<Type>(entityName: "Type")
    }

    @NSManaged public var slot: Int64
    @NSManaged public var name: String?
    @NSManaged public var pokemon: Pokemon?

}

extension Type : Identifiable {

}
