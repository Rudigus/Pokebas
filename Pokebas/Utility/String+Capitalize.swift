//
//  String+Capitalize.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 21/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
