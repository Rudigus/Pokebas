//
//  IDViewCell.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 01/03/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import UIKit

class IDViewCell: UITableViewCell {

    var idLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupIDLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
    }

    func setupIDLabel() {
        addSubview(idLabel)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            idLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
