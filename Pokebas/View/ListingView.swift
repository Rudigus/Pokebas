//
//  ListingView.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

extension UIColor {
    static let pokebasLightGray = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0)
}

class ListingView: UIView {

    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()

    let pokemonListing: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: PokemonCell.cellWidth, height: PokemonCell.cellHeight)
        layout.minimumLineSpacing = CGFloat(integerLiteral: 24)
        let pokemonListing = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //pokemonListing.layer.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        //pokemonListing.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //pokemonListing.backgroundColor = UIColor.systemBlue
        pokemonListing.backgroundColor = .pokebasLightGray
        return pokemonListing
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        setupSearchBar()
        setupPokemonListing()
    }

    func setupSearchBar() {
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5)
        ])
    }

    func setupPokemonListing() {
        addSubview(pokemonListing)
        pokemonListing.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pokemonListing.topAnchor.constraint(equalTo: searchBar.topAnchor, constant: 50),
            pokemonListing.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonListing.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            pokemonListing.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
