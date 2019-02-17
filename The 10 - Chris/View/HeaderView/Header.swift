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
    
    let searchField = HeaderSearchBar(frame: .zero)

    var nowPlayingAction: (() -> Void)?
    var comingSoonAction: (() -> Void)?
    var nowPlaying = true
    
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
        button.setImage(#imageLiteral(resourceName: "nowplaying highlight"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(nowPlayingTapped), for: .touchUpInside)
        return button
    }()

    var comingSoonButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "comingsoon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(comingSoonTapped), for: .touchUpInside)
        return button
    }()
    
    var searchLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.smallText
        label.textColor = UIColor.searchLabel
        label.text = "SEARCH"
        return label
    }()
    // for now playing underline
    let underlineOne: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.buttonHighlighted
        return view
    }()
    //for coming soon underline
    let underlineTwo: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.buttonHighlighted
        return view
    }()
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        setupSearchLabel()
        setupSearchBar()
        setupMenuButtons()
    }
}

// MARK - auto layout constraints
extension Header {
    private func setupSearchLabel() {
        addSubview(searchLabel)
        NSLayoutConstraint.activate([
            searchLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            searchLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25)
            ])
    }
    
    private func setupSearchBar() {
        addSubview(searchField)
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 1),
            searchField.leftAnchor.constraint(equalTo: searchLabel.leftAnchor),
            searchField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25),
            searchField.heightAnchor.constraint(equalToConstant: 35)
            ])
    }

    #warning("handle network connectivity!!! his edge cases -- error handling -- screen sizes -- good error handling and notifications for it")
    private func setupMenuButtons() {
        addSubview(nowPlayingButton)
        NSLayoutConstraint.activate([
            nowPlayingButton.leftAnchor.constraint(equalTo: searchField.leftAnchor, constant: 25),
            nowPlayingButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            nowPlayingButton.widthAnchor.constraint(equalToConstant: 100),
            nowPlayingButton.heightAnchor.constraint(equalToConstant: 30),
            ])

        addSubview(underlineOne)
        NSLayoutConstraint.activate([
            underlineOne.leftAnchor.constraint(equalTo: nowPlayingButton.leftAnchor, constant: 15),
            underlineOne.rightAnchor.constraint(equalTo: nowPlayingButton.rightAnchor, constant: -15),
            underlineOne.topAnchor.constraint(equalTo: nowPlayingButton.bottomAnchor, constant: 3),
            underlineOne.heightAnchor.constraint(equalToConstant: 1)
            ])
        
        addSubview(comingSoonButton)
        NSLayoutConstraint.activate([
            comingSoonButton.rightAnchor.constraint(equalTo: searchField.rightAnchor, constant: -25),
            comingSoonButton.centerYAnchor.constraint(equalTo: nowPlayingButton.centerYAnchor),
            comingSoonButton.widthAnchor.constraint(equalToConstant: 100),
            comingSoonButton.heightAnchor.constraint(equalToConstant: 30),
            ])
        
        addSubview(underlineTwo)
        underlineTwo.alpha = 0
        NSLayoutConstraint.activate([
            underlineTwo.leftAnchor.constraint(equalTo: comingSoonButton.leftAnchor, constant: 15),
            underlineTwo.rightAnchor.constraint(equalTo: comingSoonButton.rightAnchor, constant: -15),
            underlineTwo.topAnchor.constraint(equalTo: comingSoonButton.bottomAnchor, constant: 3),
            underlineTwo.heightAnchor.constraint(equalToConstant: 1)
            ])
    }
}

// MARK - button actions
extension Header {
    func underlineButton() {
        nowPlaying = !nowPlaying
        if nowPlaying {
            nowPlayingButton.setImage(#imageLiteral(resourceName: "nowplaying highlight"), for: .normal)
            comingSoonButton.setImage(#imageLiteral(resourceName: "comingsoon"), for: .normal)
            underlineOne.alpha = 1
            underlineTwo.alpha = 0
        } else {
            nowPlayingButton.setImage(#imageLiteral(resourceName: "nowplaying"), for: .normal)
            comingSoonButton.setImage(#imageLiteral(resourceName: "comingsoon highlight"), for: .normal)
            underlineTwo.alpha = 1
            underlineOne.alpha = 0
        }
    }
    
    @objc private func comingSoonTapped() {
        comingSoonAction?()
    }
    
    @objc private func nowPlayingTapped() {
        nowPlayingAction?()
    }
}


