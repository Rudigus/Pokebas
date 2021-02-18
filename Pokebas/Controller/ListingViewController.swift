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
    var presenter: ListingPresenterProtocol?

    override func loadView() {
        listingView = ListingView()
        view = listingView
        listingView.backgroundColor = .pokebasLightGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ListingPresenter(delegate: self)
        setupCollectionView()
        presenter?.loadPokemons()
    }

    func setupCollectionView() {
        listingView.pokemonListing.register(PokemonCell.self, forCellWithReuseIdentifier: "PokemonCell")
        listingView.pokemonListing.dataSource = self
        listingView.pokemonListing.prefetchDataSource = self
        listingView.pokemonListing.delegate = self
    }
}

extension ListingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDataSourcePrefetching {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getPokemonCount() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        presenter?.changePageIfNeeded(row: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print(dataArray[indexPath.row])
        // This would only fail if the setup was wrong
        let cell = listingView.pokemonListing.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        if let pokemon = presenter?.getPokemon(at: indexPath.row) {
            if !ImageFetcher().isImageCached(imgURL: pokemon.listingImageURL) {
                cell.pokemonImageView.image = UIImage(named: "Silhouette")
            } else {
                cell.pokemonImageView.image = nil
            }
            cell.pokemonNameLabel.text = pokemon.name?.capitalizingFirstLetter()
            cell.setPokemonImage(imgURL: pokemon.listingImageURL)
        } else {
            cell.pokemonImageView.image = nil
            cell.pokemonNameLabel.text = nil
        }
        //cell.backgroundColor = UIColor.systemRed
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let pokemon = presenter?.getPokemon(at: indexPath.row) {
            navigationController?.pushViewController(DetailViewController(pokemon: pokemon), animated: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//        for indexPath in indexPaths {
//            let pokemon = dataArray[indexPath.row]
//            _ = ImageFetcher().fetchImage(from: pokemon.listingImageURL)
//            {
//
//            }
//        }
    }

}

extension ListingViewController: ListingPresenterDelegate {

    func renderPokemons() {
        self.listingView.pokemonListing.reloadData()
    }

}
