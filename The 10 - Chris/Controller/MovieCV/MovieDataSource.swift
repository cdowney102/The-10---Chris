//
//  NowPlayingDataSource.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// dataSource for home screen movies

import UIKit

class MoviesDataSource: NSObject {
    // array for filtering movies during search
    var foundMovies: [Movie]?
    // reference to CV in screen
    weak var collectionView: UICollectionView?
    
    var movies = [Movie]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    func retrieveMovie(at index: Int) -> Movie {
        let movie = movies[index]
        return movie
    }
    
    func search(for searchString: String?) {
        // conduct search if the field is not empty
        if let text = searchString, !text.isEmpty {
            foundMovies = movies.filter { movie in movie.matches(text) }
        } else {
            foundMovies = nil
        }
        collectionView?.reloadData()
    }
}

// MARK - cv methods
extension MoviesDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foundMovies?.count ?? movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        // check which array we should be using by seeing if foundmovies is nil
        let movie = foundMovies?[indexPath.row] ?? movies[indexPath.row]
        cell.setCellDataFor(movie)
        return cell
    }
}
