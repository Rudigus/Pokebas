//
//  ApiController.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

class ApiController {

    func getPokemons(count: Int, completion: @escaping ([Pokemon]) -> Void) {
        // Building the request
        let pokemonsURL = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(count)")!
        var pokemonsRequest = URLRequest(url: pokemonsURL)
        pokemonsRequest.httpMethod = "GET"
        // Requesting
        let task = URLSession.shared.dataTask(with: pokemonsRequest) { data, _, _ in
            //print(data)
            //print(response)
            //print(error)
            guard let data = data else { return }
            do {
                let pokemonLookup = try JSONDecoder().decode(PokemonLookup.self, from: data)
                var pokemons: [Pokemon] = []
                for pokemon in pokemonLookup.results {
                    self.getPokemon(withURL: pokemon.url) { pokemon in
                        pokemons.append(pokemon)
                    }
                }
                while(pokemons.count < count) { }
                completion(pokemons)
            } catch {
                print(error)
            }
        }
        task.resume()
    }

    func getPokemon(withID id: Int, completion: @escaping (Pokemon) -> Void) {
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
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(pokemon)
            } catch {
                print(error)
            }
        }
        task.resume()
    }

    func getPokemon(withURL url: URL, completion: @escaping (Pokemon) -> Void) {
        // Building the request
        var pokemonRequest = URLRequest(url: url)
        pokemonRequest.httpMethod = "GET"
        // Requesting
        let task = URLSession.shared.dataTask(with: pokemonRequest) { data, _, _ in
            //print(data)
            //print(response)
            //print(error)
            guard let data = data else { return }
            do {
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(pokemon)
            } catch {
                print(error)
            }
        }
        task.resume()
    }

}
