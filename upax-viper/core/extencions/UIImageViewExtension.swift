//
//  UIImageViewExtension.swift
//  upax-viper
//
//  Created by Jossue Betancourt on 08/05/22.
//

import Foundation
import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
    
    func loadImage(urlString: String) {
            
            if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
                self.image = cacheImage
                return
            }
            
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Couldn't download image: ", error)
                    return
                }
                
                guard let data = data else { return }
                let image = UIImage(data: data)
                imageCache.setObject(image!, forKey: urlString as AnyObject)
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }.resume()

        }
}


