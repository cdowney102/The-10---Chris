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
        
        self.selectionStyle = .none
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var directorsTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
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
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.lineBreakMode = .byWordWrapping
        label.text = "Chris"
        return label
    }()
    
    var companyTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.numberOfLines = 1
        label.font = UIFont.directorCellTitle
        label.textColor = UIColor.detailsPageText
        label.text = "Production Companies:"
        return label
    }()
    
    var companyNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.detailsTextView
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.textColor = UIColor.detailsPageText
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
        contentView.addSubview(directorsTitleLabel)
        NSLayoutConstraint.activate([
            directorsTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            directorsTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            directorsTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
           ])
        
        contentView.addSubview(directorsNameLabel)
        NSLayoutConstraint.activate([
            directorsNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            directorsNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            directorsNameLabel.topAnchor.constraint(equalTo: directorsTitleLabel.bottomAnchor, constant: -5),
            ])
    }
    
    private func setupCompanies() {
        contentView.addSubview(companyTitleLabel)
        NSLayoutConstraint.activate([
            companyTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            companyTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            companyTitleLabel.topAnchor.constraint(equalTo: directorsNameLabel.bottomAnchor, constant: 10),
            ])
        
        contentView.addSubview(companyNameLabel)
        NSLayoutConstraint.activate([
            companyNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            companyNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            companyNameLabel.topAnchor.constraint(equalTo: companyTitleLabel.bottomAnchor, constant: 1),
            companyNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
    }
}
