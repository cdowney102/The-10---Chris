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
        
        self.selectionStyle = .none
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var castImageOne: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "no poster")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var castImageTwo: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "no poster")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var castOneLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.cellTitle
        label.textColor = UIColor.detailsPageText
        label.text = "Robert Downey Jr."
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        return label
    }()
    
    var castTwoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.cellTitle
        label.textColor = UIColor.detailsPageText
        label.text = "Robert Downey Jr."
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        return label
    }()
    
    var castThreeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.cellTitle
        label.textColor = UIColor.detailsPageText
        label.text = "Robert Downey Jr."
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        return label
    }()
    
    var castImageThree: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "no poster")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private func configure() {
        backgroundColor = UIColor.detailsRed
        setupCastImages()
        setupCastLabels()
    }
}

// MARK - setup cell data
extension CastCell {
    // REFACTOR THIS ASAP AFTER WORKING
    func setupCell(with data: [CastMember]) {
        if data.count == 3 {
            // dl 3
            castImageOne.downloadImage(imageType: ImageType.castImage, path: data[0].profilePath ?? "")
            castImageTwo.downloadImage(imageType: ImageType.castImage, path: data[1].profilePath ?? "")
            castImageThree.downloadImage(imageType: ImageType.castImage, path: data[2].profilePath ?? "")
            
            castImageThree.isHidden = false
            castImageTwo.isHidden = false
            castOneLabel.text = data[0].name
            castTwoLabel.text = data[1].name
            castThreeLabel.text = data[2].name
            
        } else if data.count == 2 {
            // dl first 2
            castImageOne.downloadImage(imageType: ImageType.castImage, path: data[0].profilePath ?? "")
            castImageTwo.downloadImage(imageType: ImageType.castImage, path: data[1].profilePath ?? "")
            castImageThree.isHidden = true
            castImageTwo.isHidden = false

            castOneLabel.text = data[0].name
            castTwoLabel.text = data[1].name
            castThreeLabel.isHidden = true
            
        } else if data.count == 1 {
            //dl first only
            castImageOne.downloadImage(imageType: ImageType.castImage, path: data[0].profilePath ?? "")
            castImageTwo.isHidden = true
            castImageThree.isHidden = true
            
            castOneLabel.text = data[0].name
            castTwoLabel.isHidden = true
            castThreeLabel.isHidden = true
        }
    }
}

// MARK - autolayout code
extension CastCell {
    private func setupCastLabels() {
        contentView.addSubview(castOneLabel)
        NSLayoutConstraint.activate([
            castOneLabel.leftAnchor.constraint(equalTo: castImageOne.leftAnchor, constant: -3),
            castOneLabel.rightAnchor.constraint(equalTo: castImageOne.rightAnchor, constant: 3),
            castOneLabel.topAnchor.constraint(equalTo: castImageOne.bottomAnchor, constant: 3),
            castOneLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5)
            ])
        
        contentView.addSubview(castTwoLabel)
        NSLayoutConstraint.activate([
            castTwoLabel.leftAnchor.constraint(equalTo: castImageTwo.leftAnchor, constant: -3),
            castTwoLabel.rightAnchor.constraint(equalTo: castImageTwo.rightAnchor, constant: 3),
            castTwoLabel.topAnchor.constraint(equalTo: castImageTwo.bottomAnchor, constant: 3),
            castTwoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5)
            ])
        
        contentView.addSubview(castThreeLabel)
        NSLayoutConstraint.activate([
            castThreeLabel.leftAnchor.constraint(equalTo: castImageThree.leftAnchor, constant: -3),
            castThreeLabel.rightAnchor.constraint(equalTo: castImageThree.rightAnchor, constant: 3),
            castThreeLabel.topAnchor.constraint(equalTo: castImageThree.bottomAnchor, constant: 3),
            castThreeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5)
            ])
    }
    
    private func setupCastImages() {
        // MARK - cast image sizing
        let imageSize: CGFloat = 70
        contentView.addSubview(castImageTwo)
        NSLayoutConstraint.activate([
            castImageTwo.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            castImageTwo.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            castImageTwo.heightAnchor.constraint(equalToConstant: imageSize),
            castImageTwo.widthAnchor.constraint(equalToConstant: imageSize)
            ])
        
        contentView.addSubview(castImageOne)
        NSLayoutConstraint.activate([
            castImageOne.centerYAnchor.constraint(equalTo: castImageTwo.centerYAnchor),
            castImageOne.heightAnchor.constraint(equalToConstant: imageSize),
            castImageOne.widthAnchor.constraint(equalToConstant: imageSize),
            castImageOne.rightAnchor.constraint(equalTo: castImageTwo.leftAnchor, constant: -30)
            ])
        
        contentView.addSubview(castImageThree)
        NSLayoutConstraint.activate([
            castImageThree.centerYAnchor.constraint(equalTo: castImageTwo.centerYAnchor),
            castImageThree.heightAnchor.constraint(equalToConstant: imageSize),
            castImageThree.widthAnchor.constraint(equalToConstant: imageSize),
            castImageThree.leftAnchor.constraint(equalTo: castImageTwo.rightAnchor, constant: 30)
            ])
        
        castImageOne.layer.cornerRadius = imageSize / 2
        castImageTwo.layer.cornerRadius = imageSize / 2
        castImageThree.layer.cornerRadius = imageSize / 2
    }
}

