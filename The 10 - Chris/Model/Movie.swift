//
//  Movie.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

struct Movie: Decodable, Equatable {
    
    var title: String
    var originalTitle: String
    var overview: String
    var originalLanguage: String
    var releaseDate: String
    var backdropPath: String?
    var posterPath: String?
    
    var genreIds: [Int]
    var id: Int
    var voteCount: Int
    
    var popularity: Double
    var voteAverage: Double
    
    var adult: Bool
    var video: Bool

    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
    
    func matches(_ text: String) -> Bool {
        return self.title.lowercased().contains(text.lowercased())
    }
    
    // MARK - This will hold all the genre names for the movie
    var genres: String {
        // MARK - fetch genre struct for movie --
        let matchedGenres: [Genre]? = GenreList.shared?.filter { genreIds.contains($0.id) }
        // MARK - we only care about the genre name
        let genreNames = matchedGenres?.map { $0.name }
        // MARK - return a string list of the genre names
        let list = genreNames?.joined(separator: ", ")
        
        return list ?? ""
    }
    
    var cast: [CastMember]?
    var directors: String?
    var productionCompanies: String?
    var mpaaRating: String?
}
