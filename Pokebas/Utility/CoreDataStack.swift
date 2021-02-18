//
//  CoreDataStack.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 16/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import UIKit
import CoreData

// MARK: - Core Data stack

enum StorageType {
    case persistent, inMemory
}

class CoreDataStack {
    public static let shared = CoreDataStack(.persistent)
    public static let inMemory = CoreDataStack(.inMemory)

    private static let modelName: String = "Pokebas"

    private var persistentContainer: NSPersistentContainer

    private(set) lazy var managedContext: NSManagedObjectContext = {
      return self.persistentContainer.viewContext
    }()

    init(_ storageType: StorageType = .persistent) {
        self.persistentContainer = NSPersistentContainer(name: CoreDataStack.modelName)

        if storageType == .inMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            self.persistentContainer.persistentStoreDescriptions = [description]
        }

        self.persistentContainer.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                print("CoreDataStack Error - Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    @discardableResult
    func save() -> Bool {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                return true
            } catch let error as NSError {
                print("CoreDataStack Error - Unresolved error \(error), \(error.userInfo)")
                return false
            }
        }
        return true
    }

    func load(pageNumber: Int) -> [Pokemon] {
        let predicate = NSPredicate(format: "id > %d AND id <= %d", (pageNumber - 1) * 20, pageNumber * 20)
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        let fetchRequest = NSFetchRequest<Pokemon>(entityName: "Pokemon")
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            let pokemons = try managedContext.fetch(fetchRequest)
            return pokemons
        } catch {
            return []
        }
    }
}
