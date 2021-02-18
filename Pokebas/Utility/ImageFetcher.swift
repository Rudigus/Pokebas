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

    func fetchImage(from imgURL: URL, completion: @escaping (UIImage) -> Void) {
        var image = UIImage()

        if let cachedImage = ImageFetcher.imageCache.object(forKey: imgURL.absoluteString as NSString) {
            image = cachedImage
            completion(image)
        } else {
            let urlRequest = URLRequest(url: imgURL)
            URLSession.shared.dataTask(with: urlRequest) { data, _, _ in
                guard let data = data else { return }
                image = UIImage(data: data)!
                ImageFetcher.imageCache.setObject(image, forKey: imgURL.absoluteString as NSString)
                completion(image)
            }.resume()
        }
    }

    func isImageCached(imgURL: URL?) -> Bool {
        guard let imgURL = imgURL else {
            return false
        }
        if ImageFetcher.imageCache.object(forKey: imgURL.absoluteString as NSString) != nil {
            return true
        } else {
            return false
        }
    }

}
