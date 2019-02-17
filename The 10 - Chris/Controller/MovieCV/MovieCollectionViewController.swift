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
        movieListView.selectionDelegate = self
        view.addSubview(self.movieListView)
        movieListView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        movieListView.dataSource = self.dataSource
        dataSource.collectionView = self.movieListView?.movieCollectionView
    }
    
    func reloadData() {
        movieListView?.movieCollectionView.reloadData()
    }
}

// MARK - delegate methods for user selected movie protocol
extension MovieCollectionViewController: MovieSelectionDelegate {
    func didSelectMovie(_ movie: Movie) {
        //set selected movie to get basic info
        DataManager.shared.clearSelectedMovie()
        DataManager.shared.setSelectedMovie(with: movie)
        
        APIManager.shared.fetchMovieDetails(movieId: movie.id) { [ weak self ] (details: MovieDetails?, error) in
            if let error = error {
                print(error)
            } else {
                // set detailed info for movie now with query results
                DataManager.shared.setSelectedMovieDetails(with: details!)
                self?.segue()
            }
        }
    }
    
    private func segue() {
        DispatchQueue.main.async {
            let nextVC = DetailsController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
