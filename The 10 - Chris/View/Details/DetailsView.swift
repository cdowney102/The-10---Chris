//
//  DetailsView.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/16/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// detailed movie info view -- tableview for actors and directors

import UIKit

class DetailsView: UIView {
    
    let synopsisView = SynopsisView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backdrop: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "no poster")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private func configure() {
        backgroundColor = UIColor.detailsRed
        setupBackdrop()
        setupSynopsis()
    }
}

// MARK - autolayout code
extension DetailsView {
    private func setupBackdrop() {
        addSubview(backdrop)
        NSLayoutConstraint.activate([
            backdrop.topAnchor.constraint(equalTo: self.topAnchor),
            backdrop.leftAnchor.constraint(equalTo: self.leftAnchor),
            backdrop.rightAnchor.constraint(equalTo: self.rightAnchor),
            backdrop.heightAnchor.constraint(equalToConstant: self.frame.height / 3)
            ])
    }
    
    private func setupSynopsis() {
        addSubview(synopsisView)
        bringSubviewToFront(synopsisView)
        synopsisView.layer.zPosition = 99
        let width = self.frame.width - 10
        NSLayoutConstraint.activate([
            synopsisView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -75),
            synopsisView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            synopsisView.heightAnchor.constraint(equalToConstant: width + 50),
            synopsisView.widthAnchor.constraint(equalToConstant: width),
            ])
    }
}
