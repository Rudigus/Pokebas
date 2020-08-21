//
//  DetailView.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class DetailView: UIView {

    var idLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var sectionControl: UISegmentedControl = {
        let sections = ["About", "Stats", "Evolution"]
        let segmentedControl = UISegmentedControl(items: sections)
        segmentedControl.selectedSegmentIndex = 1
        return segmentedControl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupIDLabel()
        setupNameLabel()
        setupSectionControl()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupIDLabel() {
        addSubview(idLabel)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            idLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func setupSectionControl() {
        addSubview(sectionControl)
        sectionControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionControl.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 50),
            sectionControl.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}
