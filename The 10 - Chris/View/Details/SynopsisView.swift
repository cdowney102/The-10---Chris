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
    
    var movieTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.synopsisTitle
        label.textColor = UIColor.detailsPageText
        label.text = "Title"
        return label
    }()
    
    // MARK - have this display rating - release date or TBD
    var movieRatingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.synopsisTitle
        label.textColor = UIColor.detailsPageText
        label.text = "Title"
        return label
    }()
}

extension SynopsisView {
    func setViewData(for movie: Movie) {
        movieTitleLabel.text = movie.title
//        movieRatingLabel.text = "\(String(describing: movie.mpaaRating)) | \()"
    }
}
