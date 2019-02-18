//
//  CastCell.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/17/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class CastCell: UITableViewCell {
    
    static let identifier = "CastCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    #warning("add this as cell header...?")
//    var castTitleLabel: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .left
//        label.font = UIFont.synopsisLabel
//        label.textColor = UIColor.detailsPageText
//        label.text = "CAST"
//        return label
//    }()
    
    var castImageOne: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "aqua")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var castImageTwo: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "aqua")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var castImageThree: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "aqua")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func configure() {
        backgroundColor = UIColor.detailsRed
        setupCastImages()
    }
}

// MARK - set cell data method
extension CastCell {
    func setCellData(for movie: Movie) {
        // DL images -- array of url paths -- have extension on image view to DL images
        let castImages = movie.cast
    }
}

// MARK - autolayout code
extension CastCell {
//    private func setupCastLabel() {
//        addSubview(castTitleLabel)
//        NSLayoutConstraint.activate([
//            castTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
//            castTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
//            castTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
//            castTitleLabel.heightAnchor.constraint(equalToConstant: 15)
//            ])
//    }
    
    private func setupCastImages() {
        addSubview(castImageTwo)
        NSLayoutConstraint.activate([
            castImageTwo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            castImageTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            castImageTwo.heightAnchor.constraint(equalToConstant: 40),
            castImageTwo.widthAnchor.constraint(equalToConstant: 40)
            ])
        
        addSubview(castImageOne)
        NSLayoutConstraint.activate([
            castImageOne.centerYAnchor.constraint(equalTo: castImageTwo.centerYAnchor),
            castImageOne.heightAnchor.constraint(equalToConstant: 40),
            castImageOne.widthAnchor.constraint(equalToConstant: 40),
            castImageOne.rightAnchor.constraint(equalTo: castImageTwo.leftAnchor, constant: -15)
            ])
        
        addSubview(castImageThree)
        NSLayoutConstraint.activate([
            castImageThree.centerYAnchor.constraint(equalTo: castImageTwo.centerYAnchor),
            castImageThree.heightAnchor.constraint(equalToConstant: 40),
            castImageThree.widthAnchor.constraint(equalToConstant: 40),
            castImageThree.rightAnchor.constraint(equalTo: castImageTwo.rightAnchor, constant: 15)
            ])
        
        castImageOne.layer.cornerRadius = 40 / 2
        castImageTwo.layer.cornerRadius = 40 / 2
        castImageThree.layer.cornerRadius = 40 / 2
    }
}

