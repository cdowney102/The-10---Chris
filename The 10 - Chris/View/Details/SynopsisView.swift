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
        label.font = UIFont.regularText
        label.textColor = UIColor.detailsPageText
        label.text = "Ratings"
        return label
    }()
    
    var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "synopsisbox")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setupBackground()
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
}

// MARK - set data for view w movie details
extension SynopsisView {
    func setViewData(for movie: Movie) {
        let formattedDate = convertToDate(movie.releaseDate)
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "\(String(describing: movie.mpaaRating)) | \(String(describing: movie.length)) | \(formattedDate)"
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
