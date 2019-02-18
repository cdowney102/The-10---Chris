//
//  API+Error.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

enum APIError: Error {
    static let title = "Sorry!"
    
    case server
    case invalidRequest
    case badURL
    
    var description: String {
        switch (self) {
        case .server:
            return "It's not you, it's us..."
        case .invalidRequest:
            return "Invalid Request"
        default:
            return "Bad URL"
        }
    }
}
