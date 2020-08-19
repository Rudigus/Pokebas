//
//  ListingViewController.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController {

    var listingView: ListingView! = nil

    override func loadView() {
        listingView = ListingView()
        view = listingView
        listingView.backgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
//        let apiController = ApiController()
//        apiController.getPokemon(withURL: URL(string: "https://pokeapi.co/api/v2/pokemon/39/")!) { pokemon in
//            print(pokemon)
//        }
//        apiController.getPokemon(withID: 39) { pokemon in
//            print(pokemon)
//        }
        //_ = Pokebase()
    }

    func setupCollectionView() {
        listingView.pokemonListing.register(PokemonCell.self, forCellWithReuseIdentifier: "PokemonCell")
        listingView.pokemonListing.dataSource = self
        listingView.pokemonListing.delegate = self
    }

    func getPokemon(forItemAt indexPath: IndexPath, completion: @escaping (Pokemon) -> Void) {
        let pokemonID = indexPath[0] * numberOfSections(in: listingView.pokemonListing) + indexPath[1] + 1
        //print(id)
        let pokebase = Pokebase(pokemonID: pokemonID)
        let pokemons = pokebase.load()
        if let pokemon = pokemons[pokemonID] {
            print("omg")
            completion(pokemon)
        } else {
            print("fail")
            let apiController = ApiController()
            apiController.getPokemons(pokemonID: pokemonID) { pokemons in
                print("yeah")
                pokebase.save(pokemons)
            }

        }
    }

}

extension ListingViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print(indexPath)
        let cell = listingView.pokemonListing.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        getPokemon(forItemAt: indexPath) { pokemon in
            print(pokemon)
        }
        cell.backgroundColor = UIColor.systemRed
        return cell
    }

}
