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
    private static let imageCache = NSCache<NSString, UIImage>()
//    static var count = 0

    var imgURL: URL? {
        didSet {
            DispatchQueue.main.async {
                self.pokemonImageView.image = self.listingImage
            }
        }
    }

    var listingImage: UIImage? {
        guard let imgURL = imgURL else { return nil }

        let image: UIImage

        if let cachedImage = PokemonCell.imageCache.object(forKey: imgURL.absoluteString as NSString) {
            image = cachedImage
//            PokemonCell.count+=1
//            print(PokemonCell.count)
        } else {
            do {
                let data = try Data(contentsOf: imgURL)
                image = UIImage(data: data)!
                PokemonCell.imageCache.setObject(image, forKey: imgURL.absoluteString as NSString)
            } catch {
                print(error)
                image = UIImage()
            }
        }
        return image
    }

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

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pokemonImageView)
        addSubview(pokemonNameLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        pokemonImageView.image = nil
        pokemonNameLabel.text = nil
    }
}
