//
//  Pokebase.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

class Pokebase {

    let pokebaseURL: URL

    init(filename: String = "pokebase") {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        var fileURL = url.appendingPathComponent(filename)
        fileURL = fileURL.appendingPathExtension("json")
        self.pokebaseURL = fileURL
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            save([])
        }
    }

    func save(_ pokemons: [Pokemon]) {
        do {
            let jsonData = try JSONEncoder().encode(pokemons)
            try jsonData.write(to: pokebaseURL)
        } catch {
            print("It was not possible to save the pokemon listing.")
        }
    }

    func load() -> [Pokemon] {
        var pokemons: [Pokemon] = []
        do {
            let jsonData = try Data(contentsOf: pokebaseURL)
            pokemons = try JSONDecoder().decode([Pokemon].self, from: jsonData)
            return pokemons
        } catch {
            print("It was not possible to load the pokemon listing.")
            return pokemons
        }
    }

}
