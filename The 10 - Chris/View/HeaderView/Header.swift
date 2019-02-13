//
//  Header.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
//
// Header contains the seach text field, and a horizontal scroll menu for filtering on home screen

import UIKit

class Header: UIView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var nowPlayingAction: (() -> Void)?
    var comingSoonAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var nowPlayingButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Now Playing", for: .normal)
//        button.titleLabel?.font = UIFont.Style.regular
        button.setTitleColor(UIColor.purple, for: .normal)
        button.addTarget(self, action: #selector(nowPlayingTapped), for: .touchUpInside)
        return button
    }()
    
    var comingSoonButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Coming Soon", for: .normal)
//        button.titleLabel?.font = UIFont.Style.regular
        button.setTitleColor(UIColor.purple, for: .normal)
        button.addTarget(self, action: #selector(comingSoonTapped), for: .touchUpInside)
        return button
    }()
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.orange
        setupMenuButtons()
    }
}

// MARK - auto layout constraints
extension Header {
    private func setupMenuButtons() {
        set this next
    }
}

// MARK - button actions
extension Header {
    @objc private func comingSoonTapped() {
        comingSoonAction?()
    }
    
    @objc private func nowPlayingTapped() {
        nowPlayingAction?()
    }
}


