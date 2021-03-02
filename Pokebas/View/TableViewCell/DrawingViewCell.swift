//
//  DrawingViewCell.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 01/03/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import UIKit

class DrawingViewCell: UITableViewCell {

    var drawingBackgroundView: UIView = {
        let view = UIView()
        return view
    }()

    var drawingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupDrawingBackgroundView()
        setupDrawingImageView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadDrawingImage(pokemon: Pokemon) {
        if let url = URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(pokemon.id).png") {
            ImageFetcher().fetchImage(from: url) { image in
                DispatchQueue.main.async {
                    UIView.transition(with: self.drawingImageView,
                                      duration: 0.5,
                                  options: .transitionCrossDissolve,
                                  animations: { self.drawingImageView.image = image },
                                  completion: nil)
                }
            }
        }
    }

    func setupDrawingBackgroundView() {
        addSubview(drawingBackgroundView)
        drawingBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            drawingBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            drawingBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            drawingBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            drawingBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupDrawingImageView() {
        addSubview(drawingImageView)
        drawingImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            drawingImageView.topAnchor.constraint(equalTo: topAnchor),
            drawingImageView.bottomAnchor.constraint(equalTo: drawingBackgroundView.bottomAnchor),
            drawingImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }

}
