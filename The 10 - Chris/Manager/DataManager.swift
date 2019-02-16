//
//  SessionManager.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class DataManager {
    
    static let shared = DataManager()

    var nowPlaying = [Movie]()
    var comingSoon = [Movie]()
    var selectedMovie: Movie? = nil
    
    func setSelectedMovie(with movie: Movie) {
        DataManager.shared.selectedMovie = movie
    }
    
    func clearSelectedMovie() {
        DataManager.shared.selectedMovie = nil
    }
}

