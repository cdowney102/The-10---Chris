//
//  NowPlayingDataSource.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class MoviesDataSource: NSObject, UICollectionViewDataSource {
    
    var movies = [Movie]() { didSet {
        self.collectionView?.reloadData()
    }}
    var foundMovies: [Movie]?
    weak var collectionView: UICollectionView?
    
    func search(for searchString: String?) {
        if let text = searchString, !text.isEmpty {
            self.foundMovies = self.movies.filter { movie in movie.matches(text) }
        } else {
            self.foundMovies = nil
        }
        self.collectionView?.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies = DataManager.shared.nowPlaying
        return foundMovies?.count ?? movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        let movie = foundMovies?[indexPath.row] ?? movies[indexPath.row]
        cell.setCellDataFor(movie)
        return cell
    }
}
