//
//  ListingView.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class ListingView: UIView {

    private let searchBar: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        setupSearchBar()
    }

    func setupSearchBar() {
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

        ])
    }
}
