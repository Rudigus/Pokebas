//
//  Pokebase.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

//import Foundation
//
//class Pokebase {
//
//    let pokebaseURL: URL
//
//    init(pageNumber: Int) {
//        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        var fileURL = url.appendingPathComponent("pokebase_\(pageNumber)")
//        fileURL = fileURL.appendingPathExtension("json")
//        //print(fileURL)
//        self.pokebaseURL = fileURL
//        if !FileManager.default.fileExists(atPath: fileURL.path) {
//            save([:])
//        }
//    }
//
//    func save(_ pokemons: [Int: Pokemon]) {
//        do {
//            let jsonData = try JSONEncoder().encode(pokemons)
//            try jsonData.write(to: pokebaseURL)
//        } catch {
//            print("It was not possible to save the pokemon listing.")
//        }
//    }
//
//    func load() -> [Int: Pokemon] {
//        var pokemons: [Int: Pokemon] = [:]
//        do {
//            let jsonData = try Data(contentsOf: pokebaseURL)
//            pokemons = try JSONDecoder().decode([Int: Pokemon].self, from: jsonData)
//            return pokemons
//        } catch {
//            print("It was not possible to load the pokemon listing.")
//            return pokemons
//        }
//    }
//
// //    func load(withID pokemonID: Int) -> Pokemon? {
// //        do {
// //            let jsonData = try Data(contentsOf: pokebaseURL)
// //            let pokemons = try JSONDecoder().decode([Int: Pokemon].self, from: jsonData)
// //            return pokemons[pokemonID]
// //        } catch {
// //            print("It was not possible to load the pokemon.")
// //            return nil
// //        }
// //    }
//
//}
