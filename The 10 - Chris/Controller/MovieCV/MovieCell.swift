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
    
    var movie: Movie?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var movieImage: ScaleImageView = {
        let imageView = ScaleImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "aqua")
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
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
        label.font = UIFont.cellTitle
        label.textColor = UIColor.movieTitle
        label.text = "Title"
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        return label
    }()
    
    var ratingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.cellTitle
        label.textColor = UIColor.movieTitle
        label.text = "rating"
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
        if movie == self.movie { return }
        
        self.movie = movie
        print("Setting movie to \(movie.title)")
        let posterPath = movie.posterPath ?? ""
        movieImage.downloadImage(imageType: .poster, path: posterPath)
        //movieImage.image = #imageLiteral(resourceName: "no poster")
        movieTitle.text = movie.title
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
            movieImage.topAnchor.constraint(equalTo: self.topAnchor),
            movieImage.leftAnchor.constraint(equalTo: movieTitle.leftAnchor),
            movieImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            movieImage.bottomAnchor.constraint(equalTo: movieTitle.topAnchor, constant: -5)
            ])
    }
    
    private func setupTitle() {
        addSubview(movieTitle)
        NSLayoutConstraint.activate([
            movieTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            movieTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            movieTitle.bottomAnchor.constraint(equalTo: starImage.topAnchor),
            movieTitle.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
    
    private func setupRating() {
        addSubview(starImage)
        NSLayoutConstraint.activate([
            starImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            starImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            starImage.heightAnchor.constraint(equalToConstant: 10),
            starImage.widthAnchor.constraint(equalToConstant: 10),
            ])
        
        addSubview(ratingLabel)
        NSLayoutConstraint.activate([
            ratingLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor, constant: 1),
            ratingLabel.leftAnchor.constraint(equalTo: starImage.rightAnchor, constant: 5),
            ratingLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            ])
    }
}
