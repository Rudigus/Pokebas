//
//  DetailView.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 17/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import UIKit

class DetailView: UIView {

    var drawingBackgroundView: UIView = {
        let view = UIView()
        return view
    }()

    var drawingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

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

//    var radarChartShapeLayer: CAShapeLayer = {
//        // Path setup
//        let bezierPath = UIBezierPath()
//        // For pixel perfect center, use even scales.
//        let scale = 24
//        let startingPoint = CGPoint(x: 0, y: 0)
//        let linePoints = [
//            CGPoint(x: 4 * scale, y: -3 * scale), CGPoint(x: 8 * scale, y: 0),
//            CGPoint(x: 8 * scale, y: 5 * scale), CGPoint(x: 4 * scale, y: 8 * scale),
//            CGPoint(x: 0, y: 5 * scale)
//        ]
//        bezierPath.move(to: startingPoint)
//        for point in linePoints {
//            bezierPath.addLine(to: point)
//        }
//        bezierPath.close()
//        for point in linePoints + [startingPoint] {
//            bezierPath.move(to: CGPoint(x: 4 * scale, y: Int(2.5 * Double(scale))))
//            bezierPath.addLine(to: point)
//        }
//        // Layer setup
//        let layer = CAShapeLayer()
//        layer.path = bezierPath.cgPath
//        layer.position = CGPoint(x: 100, y: 250)
//        layer.strokeColor = UIColor.radarChartBorder.cgColor
//        layer.lineWidth = 1
//        layer.fillColor = UIColor.radarChartFill.cgColor
//        return layer
//    }()
//
//    var radarChart: UIView = {
//        let chart = UIView()
//        return chart
//    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDrawingBackgroundView()
        setupDrawingImageView()
        setupIDLabel()
        setupNameLabel()
        setupSectionControl()
//        setupRadarChart()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupDrawingBackgroundView() {
        addSubview(drawingBackgroundView)
        drawingBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            drawingBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            drawingBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            drawingBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            drawingBackgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        ])
    }

    func setupDrawingImageView() {
        addSubview(drawingImageView)
        drawingImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            drawingImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            drawingImageView.bottomAnchor.constraint(equalTo: drawingBackgroundView.bottomAnchor),
            drawingImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }

    func setupIDLabel() {
        addSubview(idLabel)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: drawingImageView.bottomAnchor, constant: 16),
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

//    func setupRadarChart() {
//        radarChart.layer.addSublayer(radarChartShapeLayer)
//        addSubview(radarChart)
//        radarChart.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            radarChart.topAnchor.constraint(equalTo: sectionControl.bottomAnchor),
//            radarChart.bottomAnchor.constraint(equalTo: bottomAnchor),
//            radarChart.widthAnchor.constraint(equalTo: widthAnchor),
//            radarChart.centerXAnchor.constraint(equalTo: centerXAnchor)
//        ])
//    }

}
