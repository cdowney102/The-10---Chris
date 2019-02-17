//
//  SynopsisView.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/16/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// top view with movie synopsis

import UIKit

class SynopsisView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var movieTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.synopsisTitle
        label.textColor = UIColor.detailsPageText
        label.text = "Title"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    // MARK - have this display rating through release date or TBD
    var movieRatingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.smallBold
        label.textColor = UIColor.detailsPageText
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.text = "Ratings"
        return label
    }()
    
    var movieGenreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.smallBold
        label.textColor = UIColor.detailsPageText
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.text = "Genre"
        return label
    }()
    
    var synopsisLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.synopsisLabel
        label.textColor = UIColor.detailsPageText
        label.text = "Synopsis"
        return label
    }()
    
    var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "synopsisbox")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var starImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "Home Yellow Star-1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var imdbLogo: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "IMDb Logo-1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var textView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = false
        tv.isScrollEnabled = true
        tv.textAlignment = .left
        tv.textColor = UIColor.detailsPageText
        tv.font = UIFont.detailsTextView
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
//        tv.textContainerInset = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setupBackground()
        setupTitle()
        setupImdbStar()
        setupRatingAndDates()
        setupGenre()
        setupSynopsis()
    }
}

// MARK - auto layout code
extension SynopsisView {
    private func setupBackground() {
        addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
    
    private func setupTitle() {
        addSubview(movieTitleLabel)
        NSLayoutConstraint.activate([
            movieTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            movieTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25),
            movieTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            movieTitleLabel.heightAnchor.constraint(equalToConstant: 70)
            ])
    }
    
    private func setupImdbStar() {
        addSubview(imdbLogo)
        NSLayoutConstraint.activate([
            imdbLogo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            imdbLogo.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: -5),
            imdbLogo.heightAnchor.constraint(equalToConstant: 15),
            imdbLogo.widthAnchor.constraint(equalToConstant: 25)
            ])
        
        addSubview(starImage)
        NSLayoutConstraint.activate([
            starImage.centerYAnchor.constraint(equalTo: imdbLogo.centerYAnchor, constant: -1),
            starImage.heightAnchor.constraint(equalToConstant: 12),
            starImage.widthAnchor.constraint(equalToConstant: 12),
            starImage.leftAnchor.constraint(equalTo: imdbLogo.rightAnchor, constant: 5)
            ])
    }
    
    private func setupRatingAndDates() {
        addSubview(movieRatingLabel)
        NSLayoutConstraint.activate([
            movieRatingLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            movieRatingLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            movieRatingLabel.topAnchor.constraint(equalTo: imdbLogo.bottomAnchor, constant: 12),
            movieRatingLabel.heightAnchor.constraint(equalToConstant: 12)
            ])
    }
    
    private func setupGenre() {
        addSubview(movieGenreLabel)
        NSLayoutConstraint.activate([
            movieGenreLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            movieGenreLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25),
            movieGenreLabel.topAnchor.constraint(equalTo: movieRatingLabel.bottomAnchor, constant: 5),
            movieGenreLabel.heightAnchor.constraint(equalToConstant: 12)
            ])
    }
    
    private func setupSynopsis() {
        addSubview(synopsisLabel)
        NSLayoutConstraint.activate([
            synopsisLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            synopsisLabel.topAnchor.constraint(equalTo: movieGenreLabel.bottomAnchor, constant: 20),
            synopsisLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        #warning("text is overlapping")
        addSubview(textView)
        NSLayoutConstraint.activate([
            textView.leftAnchor.constraint(equalTo: self.leftAnchor),
            textView.rightAnchor.constraint(equalTo: self.rightAnchor),
            textView.topAnchor.constraint(equalTo: synopsisLabel.bottomAnchor, constant: 4),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
            ])
    }
}

// MARK - set data for view w movie details
extension SynopsisView {
    func setViewData(for movie: Movie) {
        let formattedDate = convertToDate(movie.releaseDate)
        movieTitleLabel.text = movie.title
        // its okay to force unwrap here because we set default values when a movie is selected if its nil
        movieRatingLabel.text = "\(String(describing: movie.mpaaRating!))  •  \(String(describing: movie.length!))  •  \(formattedDate)"
        starImage.setStarRating(with: movie.voteAverage)
        movieGenreLabel.text = movie.genres.replacingOccurrences(of: ",", with: " /")
        textView.text = movie.overview
    }
}

// MARK - date converter - instead of extension to avoid inout func
extension SynopsisView {
    func convertToDate(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
        let date = dateFormatter.date(from: date)
        if let date = date {
            dateFormatter.dateFormat = "MMM d, yyyy"
            let finalDate = dateFormatter.string(from: date)
            return finalDate
        }
        return "TBD"
    }
}
