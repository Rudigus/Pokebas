//
//  DetailViewController.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    enum ReuseIdentifier: String {
        case drawingViewCell, idViewCell, nameViewCell, typeStackViewCell
    }

    var detailView: DetailView! = nil
    var pokemon: Pokemon?
    var gradient: CAGradientLayer = CAGradientLayer()
    var types: (firstType: Type, secondType: Type?)?
    var typeColors: (firstColor: UIColor, secondColor: UIColor?)?

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
        navigationItem.largeTitleDisplayMode = .never
        setTypeColors()
        setupNavigationBar()
        setupTableView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //gradient.frame = detailView.drawingBackgroundView.bounds
    }

    func setTypeColors() {
        guard let pokemon = pokemon else {
            return
        }
        let firstType = pokemon.types.filter {$0.slot == 1}.first!
        let secondType = pokemon.types.filter {$0.slot == 2}.first
        types = (firstType: firstType, secondType: secondType)
        typeColors = (firstColor: UIColor.getColor(for: firstType)!, secondColor: UIColor.getColor(for: secondType))
    }

    func setupTableView() {
        detailView.tableView.delegate = self
        detailView.tableView.dataSource = self

        detailView.tableView.register(DrawingViewCell.self, forCellReuseIdentifier: ReuseIdentifier.drawingViewCell.rawValue)
        detailView.tableView.register(IDViewCell.self, forCellReuseIdentifier: ReuseIdentifier.idViewCell.rawValue)
        detailView.tableView.register(NameViewCell.self, forCellReuseIdentifier: ReuseIdentifier.nameViewCell.rawValue)
        detailView.tableView.register(TypeStackViewCell.self, forCellReuseIdentifier: ReuseIdentifier.typeStackViewCell.rawValue)
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .pokebasLightGray
        var tintColor: UIColor?
        guard let typeColors = typeColors else {
            return
        }
        if self.traitCollection.userInterfaceStyle == .dark {
            tintColor = typeColors.firstColor.changeColor(saturation: 0.35, brightness: 0.9)
        } else {
            tintColor = typeColors.firstColor.changeColor(saturation: 0.7, brightness: 0.6)
        }
        self.navigationController?.navigationBar.tintColor = tintColor
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Height + UIEdgeInsets.top
        switch indexPath.row {
        case 0:
            return 190
        case 1:
            return 50
        case 2:
            return 50
        case 3:
            return 38
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emptyCell = UITableViewCell()
        guard let pokemon = pokemon else {
            return emptyCell
        }
        switch indexPath.row {
        // Drawing View Cell
        case 0:
            let cell = detailView.tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.drawingViewCell.rawValue, for: indexPath) as! DrawingViewCell
            cell.loadDrawingImage(pokemon: pokemon)
            guard let firstColor = typeColors?.firstColor else {
                return emptyCell
            }
            if pokemon.types.count == 2 {
                guard let secondColor = typeColors?.secondColor else {
                    return emptyCell
                }
                gradient.colors = [firstColor.cgColor, secondColor.cgColor]
                gradient.locations = [0.0 , 1.0]
                gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
                gradient.frame = cell.bounds
                cell.drawingBackgroundView.layer.addSublayer(gradient)
            } else {
                cell.drawingBackgroundView.backgroundColor = firstColor
            }
            return cell
        // ID View Cell
        case 1:
            let cell = detailView.tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.idViewCell.rawValue, for: indexPath) as! IDViewCell
            cell.backgroundColor = .pokebasLightGray
            cell.idLabel.text = "#\(pokemon.id)"
            return cell
        // Name View Cell
        case 2:
            let cell = detailView.tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.nameViewCell.rawValue, for: indexPath) as! NameViewCell
            cell.backgroundColor = .pokebasLightGray
            cell.nameLabel.text = pokemon.name?.capitalizingFirstLetter()
            return cell
        // Type Stack View Cell
        case 3:
            let cell = detailView.tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.typeStackViewCell.rawValue, for: indexPath) as! TypeStackViewCell
            cell.backgroundColor = .pokebasLightGray
            guard let types = types else {
                return emptyCell
            }
            cell.firstType.backgroundColor = typeColors?.firstColor
            cell.firstType.typeName.text = types.firstType.name?.capitalizingFirstLetter()
            if pokemon.types.count == 2 {
                cell.secondType.backgroundColor = typeColors?.secondColor
                cell.secondType.typeName.text = types.secondType!.name?.capitalizingFirstLetter()
            } else {
                cell.typeStackView.removeArrangedSubview(cell.secondType)
                cell.secondType.removeFromSuperview()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
