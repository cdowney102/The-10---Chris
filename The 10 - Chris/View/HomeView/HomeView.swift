//
//  HomeView.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    let header = Header(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Home Background"))
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = UIColor.white
        configure()
    }
    
    private func configure() {
        setupHeader()
    }
}

// MARK - auto layout constraints 
extension HomeView {
    private func setupHeader() {
        addSubview(header)
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            header.leftAnchor.constraint(equalTo: self.leftAnchor),
            header.rightAnchor.constraint(equalTo: self.rightAnchor),
            header.heightAnchor.constraint(equalToConstant: 140)
            ])
    }
}


