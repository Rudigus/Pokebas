//
//  PokemonCell.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 19/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    var pokemonImage: UIImage?

    override init(frame: CGRect) {
        super.init(frame: frame)
        pokemonImage = UIImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
