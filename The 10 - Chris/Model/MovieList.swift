//
//  MovieList.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
//
// outer wrapper for api fetch results response

import Foundation

struct MovieList: Decodable {

    var results: [Movie]
    
    func initWithData(data: Data) -> MovieList? {
        do {
            return try JSONDecoder().decode(MovieList.self, from: data)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
