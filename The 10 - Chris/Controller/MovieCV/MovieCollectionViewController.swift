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
        dataSource?.search(for: searchString)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieListView = MovieListView(frame: self.view.bounds)
        view.addSubview(self.movieListView)
        movieListView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        movieListView.dataSource = self.dataSource
        dataSource.collectionView = self.movieListView?.movieCollectionView
    }
    
    func reloadData() {
        movieListView?.movieCollectionView.reloadData()
    }
}


