//
//  DownloadView.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 28/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import UIKit

class DownloadView: UIView {

    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pokebas"
        return label
    }()

    var downloadMessage: UITextView = {
        let label = UITextView()
        return label
    }()

    var downloadButton: UIButton = {
        let button = UIButton()
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleLabel()
        setupDownloadMessage()
        setupDownloadButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        ])
    }

    func setupDownloadMessage() {
        addSubview(downloadMessage)
        downloadMessage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            downloadMessage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            downloadMessage.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            downloadMessage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }

    func setupDownloadButton() {
        addSubview(downloadButton)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            downloadButton.topAnchor.constraint(equalTo: downloadMessage.bottomAnchor, constant: 16),
            downloadButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}
