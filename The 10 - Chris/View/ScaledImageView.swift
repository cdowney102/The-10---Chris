//
//  ScaledImageView.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/15/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// this draws our own imageView - slightly less efficient, but necessary to achieve ui design requirements
// we need left aligned, but scaled to fit

import UIKit

class ScaleImageView: UIView {
    // for image caching
    var url: URL?

    var image: UIImage? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        guard let image = self.image else { return }
        // grab ratios and rect size
        let imageRatio = image.size.width / image.size.height
        let myAspectRatio = self.bounds.width / self.bounds.height
        var renderSize = self.bounds.size
        // if its wider/ taller we need to shrink it
        if imageRatio < myAspectRatio {
            renderSize.width = self.bounds.height * imageRatio
        } else {
            renderSize.height = self.bounds.width / imageRatio
        }
        //adjust the frame then draw in
        let renderFrame = CGRect(x: 0, y: (self.bounds.height - renderSize.height) / 2, width: renderSize.width, height: renderSize.height)
        
        image.draw(in: renderFrame)
    }
}
