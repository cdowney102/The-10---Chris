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
    
    func setSelectedMovieDetails(with details: MovieDetails) {
        if let _ = DataManager.shared.selectedMovie {
            setDirectorList(with: details.credits.crew)
            setCastList(with: details.credits.cast)
            setProductionCompanyList(with: details.productionCompanies)
            setMpaaRating(with: details.releaseDates.results)
        }
    }
    
    func clearSelectedMovie() {
        DataManager.shared.selectedMovie = nil
    }
}

// MARK - sorting / simplifying methods
extension DataManager {
    private func setDirectorList(with list: [CrewMember]) {
        // MARK - filter for directors only from crew
        let directorList = list.filter { $0.job == JobType.director.rawValue }
        DataManager.shared.selectedMovie?.directors = directorList.map {$0.name}.joined(separator: ", ")
    }
    
    private func setCastList(with list: [CastMember]) {
        // we are displaying images, so dont need the person if they dont have an image
        DataManager.shared.selectedMovie?.cast = list.filter { $0.profilePath != nil }
    }
    
    private func setProductionCompanyList(with list: [ProductionCompany]) {
        // Stringify production companies
        DataManager.shared.selectedMovie?.productionCompanies = list.map { $0.name }.joined(separator: ", ")
    }
    
    private func setMpaaRating(with details: [Certification]) {
        // filter for US rating only
        let usRating = details.filter { $0.iso31661 == Country.US.rawValue }
        let reducedList = usRating[0].releaseDates
        var finalRating = "Unrated"
        for rating in reducedList {
            if rating.certification != "" {
                finalRating = rating.certification
            }
        }
        #error("here got rating now handle it")
        print(finalRating)
    }
}
