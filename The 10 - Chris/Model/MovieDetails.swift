//
//  Credits.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/16/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation

// wrapper for query info on specific movie
struct MovieDetails: Decodable {
    let credits: Credits
    let productionCompanies: [ProductionCompany]
}

// credits - cast and crew info
struct Credits: Decodable {
    let cast: [CastMember]
    let crew: [CrewMember]
}

// only need cast name and image
struct CastMember: Decodable {
    let name: String
    let profilePath: String?
}

// only need crew: director
struct CrewMember: Decodable {
    let name: String
    let job: String
}

struct ProductionCompany: Decodable {
    let name: String
}
