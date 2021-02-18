//
//  DetailViewController.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailView: DetailView! = nil
    var pokemon: Pokemon?

    init(pokemon: Pokemon) {
        super.init(nibName: nil, bundle: nil)
        self.pokemon = pokemon
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        detailView = DetailView()
        view = detailView
        detailView.backgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailView()
    }

    func setupDetailView() {
        detailView.idLabel.text = "#\(pokemon!.id)"
        detailView.nameLabel.text = pokemon?.name?.capitalizingFirstLetter()
    }

}
