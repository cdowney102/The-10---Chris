//
//  DirectorCell.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/17/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class DirectorCell: UITableViewCell {
    
    static let identifier = "DirectorCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var directorsTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.directorCellTitle
        label.textColor = UIColor.detailsPageText
        label.text = "Directors:"
        return label
    }()
    
    var directorsNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.detailsTextView
        label.textColor = UIColor.detailsPageText
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.text = "Chris"
        return label
    }()
    
    var companyTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.directorCellTitle
        label.textColor = UIColor.detailsPageText
        label.text = "Production Companies:"
        return label
    }()
    
    var companyNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.detailsTextView
        label.textColor = UIColor.detailsPageText
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.text = "Chris"
        return label
    }()
    
    private func configure() {
        backgroundColor = UIColor.detailsRed
        setupDirectors()
        setupCompanies()
    }
}

// MARK - set cell data method
extension DirectorCell {
    func setCellData(for movie: Movie) {
        companyNameLabel.text = movie.productionCompanies
        directorsNameLabel.text = movie.directors
    }
}

// MARK - autolayout code
extension DirectorCell {
    private func setupDirectors() {
        addSubview(directorsTitleLabel)
        NSLayoutConstraint.activate([
            directorsTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            directorsTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            directorsTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            directorsTitleLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        addSubview(directorsNameLabel)
        NSLayoutConstraint.activate([
            directorsNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            directorsNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            directorsNameLabel.topAnchor.constraint(equalTo: directorsTitleLabel.bottomAnchor, constant: -5),
            directorsNameLabel.heightAnchor.constraint(equalToConstant: 35)
            ])
    }
    
    private func setupCompanies() {
        addSubview(companyTitleLabel)
        NSLayoutConstraint.activate([
            companyTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            companyTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            companyTitleLabel.topAnchor.constraint(equalTo: directorsNameLabel.bottomAnchor, constant: 10),
            companyTitleLabel.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        addSubview(companyNameLabel)
        NSLayoutConstraint.activate([
            companyNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            companyNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            companyNameLabel.topAnchor.constraint(equalTo: companyTitleLabel.bottomAnchor, constant: 1),
            companyNameLabel.heightAnchor.constraint(equalToConstant: 35)
            ])
    }
}
