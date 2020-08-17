//
//  ApiController.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

class ApiController {

    func getPokemons(count: Int) {}

    func getPokemon(withID id: Int) {
        // Building the request
        let pokemonURL = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/")!
        var pokemonRequest = URLRequest(url: pokemonURL)
        pokemonRequest.httpMethod = "GET"
        // Requesting
        let task = URLSession.shared.dataTask(with: pokemonRequest) { data, _, _ in
            //print(data)
            //print(response)
            //print(error)
            guard let data = data else { return }
            do {
                let apiResponse = try JSONDecoder().decode(Pokemon.self, from: data)
                print(apiResponse)
            } catch {
                print(error)
            }
        }
        task.resume()
    }

}
