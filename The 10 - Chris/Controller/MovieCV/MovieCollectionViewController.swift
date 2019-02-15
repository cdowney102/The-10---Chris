//
//  MovieCollectionViewController.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class MovieCollectionViewController: UIViewController {
    
    convenience init(dataSource: MoviesDataSource) {
        self.init()
        
        self.dataSource = dataSource
    }
    
    var dataSource: MoviesDataSource!
    var movieListView: MovieListView!
    
    func search(for searchString: String?) {
        self.dataSource?.search(for: searchString)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieListView = MovieListView(frame: self.view.bounds)
        self.view.addSubview(self.movieListView)
        self.movieListView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.movieListView.dataSource = self.dataSource
        self.dataSource.collectionView = self.movieListView?.movieCollectionView
    }
    
    func reloadData() {
        self.movieListView?.movieCollectionView.reloadData()
    }
}

// MARK - styling
//extension MovieCollectionViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.height / 2)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//}
