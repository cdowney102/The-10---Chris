//
//  HomeView.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// the home screen main view

import UIKit
#warning("can condense this to be only a header on homecontroller")
class HomeView: UIView {
    
    let header = Header(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Home Background"))
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = UIColor.clear
        configure()
    }
    
    private func configure() {
        setupHeader()
        setupMovies()
    }
}

// MARK - auto layout constraints 
extension HomeView {
    private func setupHeader() {
        addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 150)
            ])
    }
    
    private func setupMovies() {
//        addSubview(movieList)
//           NSLayoutConstraint.activate([
//            movieList.topAnchor.constraint(equalTo: header.bottomAnchor),
//            movieList.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25),
//            movieList.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25),
//            movieList.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//            ])
    }
}


