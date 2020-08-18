//
//  ListingViewController.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController {

    override func loadView() {
        self.view = ListingView()
        view.backgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //let apiController = ApiController()
        /*apiController.getPokemon(withID: 2) { pokemon in
            print(pokemon)
            let pokebase = Pokebase()
            var pokemons = pokebase.load()
            pokemons.append(pokemon)
            pokebase.save(pokemons)
        }*/
        /*apiController.getPokemon(withURL: URL(string: "https://pokeapi.co/api/v2/pokemon/7/")!) { pokemon in
            print(pokemon)
        }*/
        /*apiController.getPokemons(count: 3) { pokemons in
            pokemons.forEach {
                print($0)
            }
        }*/
    }

}
