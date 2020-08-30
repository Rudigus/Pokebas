//
//  PokemonCell.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 19/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {

    static let cellWidth = 96
    static let cellHeight = 120

    let pokemonImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 96, height: 96))
        //imageView.image = UIImage(named: "Charmander")
        return imageView
    }()

    let pokemonNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 96, width: 96, height: 24))
        label.textAlignment = .center
        return label
    }()

    func setPokemonImage(imgURL: URL) {
        ImageFetcher().fetchImage(from: imgURL) { image in
            DispatchQueue.main.async {
                self.pokemonImageView.image = image
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pokemonImageView)
        addSubview(pokemonNameLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// Prepare for Reuse should not be used to reset content.
//    override func prepareForReuse() {
//        pokemonImageView.image = nil
//        pokemonNameLabel.text = nil
//    }
}
