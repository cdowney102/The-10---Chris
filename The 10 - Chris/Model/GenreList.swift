//
//  Genre.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
//
//
// List to map associated genre id's with actual genre name

import Foundation

struct GenreList: Decodable {
    
    static var shared: [Genre]? = nil
    
    var genres: [Genre]
    
    func initWith(data: Data) -> GenreList? {
        do {
            return try JSONDecoder().decode(GenreList.self, from: data)
        } catch {
            print("failed to decode genre list")
            return nil
        }
    }
    
    func setGenreListWith(list: GenreList) {
        GenreList.shared = list.genres
    }
    
    func listIsEmpty() -> Bool {
        return GenreList.shared != nil
    }
}
