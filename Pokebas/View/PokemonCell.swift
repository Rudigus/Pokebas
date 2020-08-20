//
//  PokemonCell.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 19/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {

    var imgURL: URL? {
        didSet {
            DispatchQueue.main.async {
                self.pokemonImageView.image = self.listingImage
            }
        }
    }

    var listingImage: UIImage? {
        guard let imgURL = imgURL else { return nil }
        do {
            let data = try Data(contentsOf: imgURL)
            let image = UIImage(data: data)!
            return image
        } catch {
            print(error)
            return UIImage()
        }
    }

    let pokemonImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 96, height: 96)))
        //imageView.image = UIImage(named: "Charmander")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pokemonImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        pokemonImageView.image = nil
    }
}
