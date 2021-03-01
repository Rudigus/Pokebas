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
    var gradient: CAGradientLayer?

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
        detailView.backgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.largeTitleDisplayMode = .never
        loadDrawingImage()
        setupDetailView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient?.frame = detailView.drawingBackgroundView.bounds
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
        let firstType = pokemon.types.filter {$0.slot == 1}.first!
        if pokemon.types.count == 2 {
            let secondType = pokemon.types.filter {$0.slot == 2}.first!
            gradient = CAGradientLayer()
            guard let gradient = gradient else {
                return
            }
            if let firstTypeEnum = TypeEnum(rawValue: firstType.name ?? "unknown"), let secondTypeEnum = TypeEnum(rawValue: secondType.name ?? "unknown") {
                gradient.colors = [UIColor.typeColors[firstTypeEnum]?.withAlphaComponent(0.5).cgColor, UIColor.typeColors[secondTypeEnum]?.withAlphaComponent(0.5).cgColor]
                gradient.locations = [0.0 , 1.0]
                gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
                gradient.frame = self.view.bounds

                detailView.drawingBackgroundView.layer.addSublayer(gradient)
            }
        } else {
            detailView.drawingBackgroundView.backgroundColor = UIColor.typeColors[TypeEnum(rawValue: firstType.name ?? "unknown") ?? TypeEnum.unknown]
            detailView.drawingBackgroundView.backgroundColor = detailView.drawingBackgroundView.backgroundColor?.withAlphaComponent(0.5)
        }
        detailView.idLabel.text = "#\(pokemon.id)"
        detailView.nameLabel.text = pokemon.name?.capitalizingFirstLetter()
        detailView.sectionControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
//        segmentedControlViews = [
//
//        ]
    }

}
