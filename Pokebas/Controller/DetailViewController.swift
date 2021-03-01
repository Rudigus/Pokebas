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
    var segmentedControlViews: [(view: UIView, segmentIndex: Int)] = []
    var gradient: CAGradientLayer = CAGradientLayer()

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
        detailView.backgroundColor = UIColor.pokebasLightGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.largeTitleDisplayMode = .never
        setupDetailView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = detailView.drawingBackgroundView.bounds
    }

    func loadDrawingImage() {
        if let pokemonID = pokemon?.id, let url = URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(pokemonID).png") {
            ImageFetcher().fetchImage(from: url) { image in
                DispatchQueue.main.async {
                    UIView.transition(with: self.detailView.drawingImageView,
                                      duration: 0.5,
                                  options: .transitionCrossDissolve,
                                  animations: { self.detailView.drawingImageView.image = image },
                                  completion: nil)
                }
            }
        }
    }

    @objc func segmentChanged(sender: UISegmentedControl) {
        for segmentView in segmentedControlViews {
            if sender.selectedSegmentIndex == segmentView.segmentIndex {
                segmentView.view.isHidden = false
            } else {
                segmentView.view.isHidden = true
            }
        }
    }

    func setupDetailView() {
        guard let pokemon = pokemon else {
            return
        }
        // Drawing Image View
        loadDrawingImage()
        // Drawing Background View
        let firstType = pokemon.types.filter {$0.slot == 1}.first!
        var typeColors: (firstColor: UIColor, secondColor: UIColor?)?
        if pokemon.types.count == 2 {
            let secondType = pokemon.types.filter {$0.slot == 2}.first!
            if let firstColor = UIColor.color(for: firstType, customAlpha: 0.5), let secondColor = UIColor.color(for: secondType, customAlpha: 0.5) {
                typeColors = (firstColor: firstColor, secondColor: secondColor)
                gradient.colors = [firstColor.cgColor, secondColor.cgColor]
                gradient.locations = [0.0 , 1.0]
                gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
                gradient.frame = self.view.bounds
            }
            detailView.drawingBackgroundView.layer.addSublayer(gradient)
        } else {
            if let color = UIColor.color(for: firstType) {
                typeColors = (firstColor: color, secondColor: nil)
                detailView.drawingBackgroundView.backgroundColor = color
            }
        }
        // ID Label
        detailView.idLabel.text = "#\(pokemon.id)"
        // Name Label
        detailView.nameLabel.text = pokemon.name?.capitalizingFirstLetter()
        // Type Stack View
        detailView.firstType.color = typeColors?.firstColor
        if pokemon.types.count == 2 {
            detailView.secondType.color = typeColors?.secondColor
        } else {
            detailView.typeStackView.removeArrangedSubview(detailView.secondType)
            detailView.secondType.removeFromSuperview()
        }
        // Section Control
        detailView.sectionControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
//        segmentedControlViews = [
//
//        ]
    }

}
