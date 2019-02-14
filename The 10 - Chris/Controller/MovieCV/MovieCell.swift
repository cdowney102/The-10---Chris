//
//  MovieCell.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// cells for each movie list collection view

import UIKit

class MovieCell: UICollectionViewCell {
    
    var movieImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "aqua")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var movieTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.smallText
        label.textColor = UIColor.movieTitle
        label.text = "Aquaman"
        return label
    }()
    
    #warning("how to solve the star rating thing - up to 10")
    private func configure() {
        backgroundColor = UIColor.clear
        setupImage()
        setupTitle()
    }
    
}

extension MovieCell {
    private func setupImage() {
        addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            movieImage.widthAnchor.constraint(equalToConstant: frame.width * 0.8),
            movieImage.heightAnchor.constraint(equalToConstant: frame.height * 0.8)
            ])
    }
    
    private func setupTitle() {
        addSubview(movieTitle)
        NSLayoutConstraint.activate([
            movieTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            movieTitle.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 5)
            ])
    }
}
