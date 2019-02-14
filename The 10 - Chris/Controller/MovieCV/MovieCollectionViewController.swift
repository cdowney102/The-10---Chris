//
//  MovieCollectionViewController.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class MovieCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    convenience init(dataSource: UICollectionViewDataSource) {
        self.init()
        
        self.dataSource = dataSource
    }
    
    var dataSource: UICollectionViewDataSource!
    var movieListView: MovieListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieListView = MovieListView(frame: self.view.bounds)
        self.view.addSubview(self.movieListView)
        self.movieListView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       
        self.movieListView.dataSource = self.dataSource


    }
    
    func reloadData() {
        self.movieListView?.movieCollectionView.reloadData()
    }
}

// MARK - styling
extension MovieCollectionViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 1, height: collectionView.frame.height / 2)
    }
}
