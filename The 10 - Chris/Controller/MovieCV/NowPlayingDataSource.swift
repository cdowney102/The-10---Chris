//
//  NowPlayingDataSource.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class NowPlayingDataSource: NSObject, UICollectionViewDataSource {
    
    var nowPlayingMovies = [Movie]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nowPlayingMovies = DataManager.shared.nowPlaying
        return nowPlayingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        let movie = nowPlayingMovies[indexPath.row]
        cell.setCellDataFor(movie)
        return cell
    }
}
