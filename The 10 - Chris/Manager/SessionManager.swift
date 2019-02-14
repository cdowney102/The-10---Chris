//
//  SessionManager.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class SessionManager {
    
    static let shared = SessionManager()
    #warning("grab only first 10")
    var nowPlaying = [Movie]()
    var upcoming = [Movie]()
    
    func setNowPlayingList(with movies: [Movie]) {
        self.nowPlaying = movies
    }
    
    func setUpcomingList(with movies: [Movie]) {
        self.upcoming = movies
    }
}
