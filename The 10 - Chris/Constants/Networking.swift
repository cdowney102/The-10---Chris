//
//  Networking.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

enum ImageType: String {
    case poster
    case backdrop
    
    var rawValue: String {
        switch self {
        case .poster:
            return "http://image.tmdb.org/t/p/w185"
        default:
            return "http://image.tmdb.org/t/p/w780"
        }
    }
}

enum ListType: String {
    case nowPlaying
    case upcoming
    case genres
    case poster
    
    var rawValue: String {
        switch self {
        case .nowPlaying:
            return "now_playing"
        case .genres:
            return "genre/movie/list"
        case .poster:
            return "http://image.tmdb.org/t/p/w185/"
        default:
            return "movie/upcoming"
        }
    }
}

// MARK - calling api endpoint consists of baseUrlPath + list type (upcoming/ now playing) + api key
let apiKey = "d52f2a679c2747d1798778bf535c1989"
let baseUrlPath = "https://api.themoviedb.org/3/"

