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

    override class var layerClass: AnyClass { return CAShapeLayer.self }

    var color: UIColor? {
        didSet {
            changeColor(to: color)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        let bezierPath = UIBezierPath(roundedRect: frameRect, cornerRadius: 15)
        if let layer = layer as? CAShapeLayer {
            layer.path = bezierPath.cgPath
//            layer.fillColor = UIColor.red.cgColor
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: frameRect.width, height: frameRect.height)
    }

    private func changeColor(to color: UIColor?) {
        guard let color = color, let layer = layer as? CAShapeLayer else {
            return
        }
        layer.fillColor = color.cgColor
    }

}
