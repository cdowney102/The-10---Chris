//
//  Extensions+ImgView.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/14/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

// MARK - download movie image or assign default image if none
extension UIImageView {
    func downloadImage(imageType: ImageType, path: String) {
        let image = #imageLiteral(resourceName: "no poster")
        guard let url = URL(string: imageType.rawValue + path) else {
            print("failed url")
            self.image = image
            return
            
        }
        DispatchQueue.global().async { [ weak self ] in
            if let data = try? Data(contentsOf: url) {
                if let img = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = img
                        return
                    }
                }
            }
        }
        self.image = image
    }
}

// MARK - to set appropriate star (color) for movie rating
extension UIImageView {
    func setStarRating(with rating: Double) {
        var star = #imageLiteral(resourceName: "Home Yellow Star-1")
        if rating < 3.5 {
            star = #imageLiteral(resourceName: "Home Red Star-1")
        } else if rating > 6.5 {
            star = #imageLiteral(resourceName: "Home Green Star-1")
        }
        self.image = star
    }
}
