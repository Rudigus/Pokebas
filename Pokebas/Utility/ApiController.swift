//
//  ApiController.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

class ApiController {

    func getPokemons(limit: Int = 20, offset: Int = 0, completion: @escaping ([Int: Pokemon]) -> Void) {
        // Building the request
        let pokemonsURL = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(limit)&offset=\(offset)")!
        var pokemonsRequest = URLRequest(url: pokemonsURL)
        pokemonsRequest.httpMethod = "GET"
        // Requesting
        let task = URLSession.shared.dataTask(with: pokemonsRequest) { data, _, _ in
            //print(data)
            //print(response)
            //print(error)
            guard let data = data else { return }
            do {
                let group = DispatchGroup()
                let pokemonLookup = try JSONDecoder().decode(PokemonLookup.self, from: data)
                var pokemons: [Int: Pokemon] = [:]
                for pokemonEntry in pokemonLookup.results {
                    //print(pokemonEntry.url)
                    group.enter()
                    self.getPokemon(withURL: pokemonEntry.url) { pokemon in
                        //print(pokemon)
                        pokemons[pokemon.id] = pokemon
                        group.leave()
                    }
                }
                group.notify(queue: .global()) {
                    completion(pokemons)
                }
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
