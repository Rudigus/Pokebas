//
//  UIColorExtension.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 27/02/21.
//  Copyright © 2021 Rudigus. All rights reserved.
//

import UIKit

extension UIColor {
    // Pokemon type colors
    static let typeColors = [
        TypeEnum.normal: #colorLiteral(red: 0.6588235294, green: 0.6549019608, blue: 0.4784313725, alpha: 1),
        TypeEnum.fire: #colorLiteral(red: 0.9333333333, green: 0.5058823529, blue: 0.1882352941, alpha: 1),
        TypeEnum.fighting: #colorLiteral(red: 0.7607843137, green: 0.1803921569, blue: 0.1568627451, alpha: 1),
        TypeEnum.water: #colorLiteral(red: 0.3882352941, green: 0.5647058824, blue: 0.9411764706, alpha: 1),
        TypeEnum.flying: #colorLiteral(red: 0.662745098, green: 0.5607843137, blue: 0.9529411765, alpha: 1),
        TypeEnum.grass: #colorLiteral(red: 0.4784313725, green: 0.7803921569, blue: 0.2980392157, alpha: 1),
        TypeEnum.poison: #colorLiteral(red: 0.6392156863, green: 0.2431372549, blue: 0.631372549, alpha: 1),
        TypeEnum.electric: #colorLiteral(red: 0.968627451, green: 0.8156862745, blue: 0.1725490196, alpha: 1),
        TypeEnum.ground: #colorLiteral(red: 0.8862745098, green: 0.7490196078, blue: 0.3960784314, alpha: 1),
        TypeEnum.psychic: #colorLiteral(red: 0.9764705882, green: 0.3333333333, blue: 0.5294117647, alpha: 1),
        TypeEnum.rock: #colorLiteral(red: 0.7137254902, green: 0.631372549, blue: 0.2117647059, alpha: 1),
        TypeEnum.ice: #colorLiteral(red: 0.5882352941, green: 0.8509803922, blue: 0.8392156863, alpha: 1),
        TypeEnum.bug: #colorLiteral(red: 0.6509803922, green: 0.7254901961, blue: 0.1019607843, alpha: 1),
        TypeEnum.dragon: #colorLiteral(red: 0.4352941176, green: 0.2078431373, blue: 0.9882352941, alpha: 1),
        TypeEnum.ghost: #colorLiteral(red: 0.4509803922, green: 0.3411764706, blue: 0.5921568627, alpha: 1),
        TypeEnum.dark: #colorLiteral(red: 0.4392156863, green: 0.3411764706, blue: 0.2745098039, alpha: 1),
        TypeEnum.steel: #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.8078431373, alpha: 1),
        TypeEnum.fairy: #colorLiteral(red: 0.8392156863, green: 0.5215686275, blue: 0.6784313725, alpha: 1)
    ]

    static let pokebasLightGray = UIColor { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
            return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        default:
            return #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        }
    }

    static func color(for type: Type, customAlpha: CGFloat? = nil) -> UIColor? {
        guard let typeName = type.name, let typeEnum = TypeEnum(rawValue: typeName) else {
            return nil
        }
        var color = UIColor.typeColors[typeEnum]
        if let customAlpha = customAlpha {
            color = color?.withAlphaComponent(customAlpha)
        }
        return color
    }

//    static let pokebasLightGray = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0)
//    static let radarChartBorder = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
//    static let radarChartFill = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
}
