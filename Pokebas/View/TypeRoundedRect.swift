//
//  TypeRoundedRect.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 01/03/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import UIKit

class TypeRoundedRect: UIView {

    let frameRect = CGRect(x: 0, y: 0, width: 128, height: 38)

    var typeName: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        setupSubviews()
    }

    func setupSubviews() {
        addSubview(typeName)
        typeName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeName.centerXAnchor.constraint(equalTo: centerXAnchor),
            typeName.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: frameRect.width, height: frameRect.height)
    }

}
