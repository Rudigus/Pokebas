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
        view = ListingView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let apiController = ApiController()
        apiController.getPokemon(withID: 2) { pokemon in
            print(pokemon)
            let pokebase = Pokebase()
            var pokemons = pokebase.load()
            pokemons.append(pokemon)
            pokebase.save(pokemons)
        }
        // Do any additional setup after loading the view.
    }

}
