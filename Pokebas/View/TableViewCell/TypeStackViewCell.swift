//
//  TypeStackViewCell.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 01/03/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import UIKit

class TypeStackViewCell: UITableViewCell {

    var typeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 32
        return stackView
    }()

    var firstType: TypeRoundedRect = {
        let rect = TypeRoundedRect()
        return rect
    }()

    var secondType: TypeRoundedRect = {
        let rect = TypeRoundedRect()
        return rect
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTypeStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }

    func setupTypeStackView() {
        typeStackView.addArrangedSubview(firstType)
        typeStackView.addArrangedSubview(secondType)
        addSubview(typeStackView)
        typeStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            typeStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
