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
    static let identifier = "MovieCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var movieImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "aqua")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var starImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "Home Green Star-1")
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
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 2
        return label
    }()
    
    var ratingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.smallText
        label.textColor = UIColor.movieTitle
        label.text = "Aquaman"
        return label
    }()
    
    private func configure() {
        backgroundColor = UIColor.clear
        setupRating()
        setupTitle()
        setupImage()
    }
}

// MARK - configure cell data
extension MovieCell {
    func setCellDataFor(_ movie: Movie) {
        let posterPath = movie.posterPath ?? ""
//        movieImage.downloadImageAt(path: posterPath)
        movieImage.image = #imageLiteral(resourceName: "no poster")
        movieTitle.text = movie.title
        // handle star coloring here
        ratingLabel.text = "\(String(describing: movie.voteAverage))/10"
        starImage.setStarRating(with: movie.voteAverage)
    }
}

// MARK - autolayout code
extension MovieCell {
    private func setupImage() {
        addSubview(movieImage)
        movieImage.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            movieImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            movieImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            movieImage.bottomAnchor.constraint(equalTo: movieTitle.topAnchor, constant: -7)
            ])
    }
    
    private func setupTitle() {
        addSubview(movieTitle)
        NSLayoutConstraint.activate([
            movieTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            movieTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            movieTitle.bottomAnchor.constraint(equalTo: starImage.topAnchor, constant: -7),
            movieTitle.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    private func setupRating() {
        addSubview(starImage)
        NSLayoutConstraint.activate([
            starImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            starImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            starImage.heightAnchor.constraint(equalToConstant: 10),
            starImage.widthAnchor.constraint(equalToConstant: 10),
            ])
        
//        addSubview(ratingLabel)
//        NSLayoutConstraint.activate([
//            ratingLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
//            ratingLabel.leftAnchor.constraint(equalTo: starImage.rightAnchor, constant: 3),
//            ])
    }
}
