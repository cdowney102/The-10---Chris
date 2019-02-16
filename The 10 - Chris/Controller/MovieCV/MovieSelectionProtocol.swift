//
//  MovieSelectionProtocol.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/16/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
// this protocol will handle setting data manager and trigger segue when user taps a movie form CV

import Foundation

protocol MovieSelectionDelegate: class {
    func didSelectMovie(_ movie: Movie)
}
