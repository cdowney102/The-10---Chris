//
//  ComingSoonDataSource.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class ComingSoonDataSource: NSObject, UICollectionViewDataSource {
    
    var comingSoonMovies = [Movie]()
    #warning("limit to 10")
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        comingSoonMovies = DataManager.shared.comingSoon
        return comingSoonMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        let movie = comingSoonMovies[indexPath.row]
        cell.setCellDataFor(movie)
        return cell
    }
}
