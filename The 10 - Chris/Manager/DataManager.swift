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
    #warning("grab only first 10")
    var nowPlaying = [Movie]()
    var comingSoon = [Movie]()
    
    func setNowPlayingList(with movies: [Movie]) {
        self.nowPlaying = movies
    }
    
    func setComingSoonList(with movies: [Movie]) {
        DataManager.shared.comingSoon = movies
    }
    
    func fetchMovies() {
        
    }
    
}

