//
//  ListingView.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class ListingView: UIView {

    let searchBar: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        return textField
    }()

    let pokemonListing: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: PokemonCell.cellWidth, height: PokemonCell.cellHeight)
        layout.minimumLineSpacing = CGFloat(integerLiteral: 24)
        let pokemonListing = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        pokemonListing.backgroundColor = UIColor.systemBlue
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
            searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            searchBar.centerXAnchor.constraint(equalTo: centerXAnchor)
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
