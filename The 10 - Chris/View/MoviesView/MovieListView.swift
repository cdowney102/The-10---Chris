//
//  MovieListView.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// view that will hold collection view of movies lists

import UIKit

class MovieListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    var dataSource: UICollectionViewDataSource? { didSet {
        self.movieCollectionView.dataSource = self.dataSource
        self.movieCollectionView?.reloadData()
    }}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var movieCollectionView: UICollectionView!
    
    private func configure() {
        backgroundColor = UIColor.clear
        setupCV()
    }
}

extension MovieListView: UICollectionViewDelegate {
    
}

extension MovieListView {
    private func setupCV() {
        let layout = UICollectionViewFlowLayout()
        movieCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.backgroundColor = UIColor.clear
        movieCollectionView.showsVerticalScrollIndicator = false
        
        movieCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self.dataSource
        addSubview(movieCollectionView)
        
        NSLayoutConstraint.activate([
            movieCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 55),
            movieCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            movieCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            movieCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
}


extension MovieListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.height / 2.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

