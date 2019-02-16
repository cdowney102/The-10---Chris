//
//  MovieListView.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// view for moviecollectionviewcontroller

import UIKit

// MARK - main view for movieCollectionViewController
class MovieListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    var dataSource: MoviesDataSource? {
        didSet {
            self.movieCollectionView.dataSource = self.dataSource
            self.dataSource?.collectionView = self.movieCollectionView
            self.movieCollectionView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.clear
        cv.showsVerticalScrollIndicator = false
        cv.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        cv.delegate = self
        cv.dataSource = self.dataSource
        return cv
    }()
    
    private func configure() {
        backgroundColor = UIColor.clear
        setupCV()
    }
}

// MARK - CV delegate methods
extension MovieListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dataSource = dataSource else { return }
        DataManager.shared.clearSelectedMovie()
        let movie = dataSource.retrieveMovie(at: indexPath.row)
        print(movie.title)
        DataManager.shared.setSelectedMovie(with: movie)
        print("SEGUE")
        #warning("time to segue")
    }
}

// MARK - autolayout stuff
extension MovieListView {
    private func setupCV() {
        addSubview(movieCollectionView)
        NSLayoutConstraint.activate([
            movieCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 55),
            movieCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            movieCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            movieCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
}

// MARK - collectionView cell styling
extension MovieListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.height / 2.3)
    }
    
    // MARK - horizontal spacing - dont forget to subtract offset in sizeForItemAt if changed
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // MARK - vertical spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}


