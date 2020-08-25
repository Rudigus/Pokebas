//
//  ImageFetcher.swift
//  Pokebas
//
//  Created by Rodrigo Matos Aguiar on 24/08/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation
import UIKit

class ImageFetcher {

    private static let imageCache = NSCache<NSString, UIImage>()

    func fetchImage(from imgURL: URL) -> UIImage {
        let image: UIImage

        if let cachedImage = ImageFetcher.imageCache.object(forKey: imgURL.absoluteString as NSString) {
            image = cachedImage
        } else {
            do {
                let data = try Data(contentsOf: imgURL)
                image = UIImage(data: data)!
                ImageFetcher.imageCache.setObject(image, forKey: imgURL.absoluteString as NSString)
            } catch {
                print(error)
                image = UIImage()
            }
        }
        return image
    }

}
