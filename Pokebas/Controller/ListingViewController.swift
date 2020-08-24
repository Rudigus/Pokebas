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
    var dataArray: [Pokemon] = [] {
        didSet {
            DispatchQueue.main.async {
                self.listingView.pokemonListing.reloadData()
            }
        }
    }
    var currentPage: Int = 1 {
        didSet {
            pokemonRequest { pokeArray in
                self.dataArray += pokeArray
            }
        }
    }

    override func loadView() {
        listingView = ListingView()
        view = listingView
        listingView.backgroundColor = .pokebasLightGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        pokemonRequest { pokeArray in
            self.dataArray = pokeArray
        }
    }

    func setupCollectionView() {
        listingView.pokemonListing.register(PokemonCell.self, forCellWithReuseIdentifier: "PokemonCell")
        listingView.pokemonListing.dataSource = self
        listingView.pokemonListing.delegate = self
    }

    func pokemonRequest(completion: @escaping ([Pokemon]) -> Void) {

        var pokeArray: [Pokemon] = []

        let pokebase = Pokebase(pageNumber: currentPage)
        let pokeDict = pokebase.load()
        if !pokeDict.isEmpty {
            pokeArray = getPokeArray(from: pokeDict)
            completion(pokeArray)
        } else {
            let apiController = ApiController()
            apiController.getPokemons(offset: (currentPage - 1) * 20) { pokeDict in
                pokebase.save(pokeDict)
                pokeArray = self.getPokeArray(from: pokeDict)
                completion(pokeArray)
            }
        }
    }

    func getPokeArray(from pokeDict: [Int: Pokemon]) -> [Pokemon] {
        var pokeArray = Array(pokeDict.values)
        pokeArray.sort {
            $0.id < $1.id
        }
        return pokeArray
    }
}

extension ListingViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row + 1 == dataArray.count {
            currentPage += 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print(dataArray[indexPath.row])
        let cell = listingView.pokemonListing.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        cell.imgURL = dataArray[indexPath.row].listingImageURL
        cell.pokemonNameLabel.text = dataArray[indexPath.row].name.capitalizingFirstLetter()
        //cell.backgroundColor = UIColor.systemRed
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(pokemon: dataArray[indexPath.row]), animated: true)
    }

}
