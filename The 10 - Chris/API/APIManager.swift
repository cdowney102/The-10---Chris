//
//  APIManager.swift
//  The 10 - Chris
//
//  Created by christopher downey on 2/12/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
//
// APIManager handles all networking ( fetching movies )

import UIKit

class APIManager {
    
    static let shared = APIManager()
    static let baseURL = URL(string: baseUrlPath)!
    
    func fetch<T: Decodable>(_ listType: ListType, completionHandler: @escaping (T?, Error?) -> ()) {
        
        // https://api.themoviedb.org/3/genre/movie/list?api_key=d52f2a679c2747d1798778bf535c1989
        let base = APIManager.baseURL.appendingPathComponent(listType.rawValue)
        var urlComponents = URLComponents(url: base, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        guard let url = urlComponents?.url else {
            completionHandler(nil, APIError.badURL)
            return
        }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completionHandler(nil, error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                switch (httpResponse.statusCode) {
                case 400...499:
                    completionHandler(nil, APIError.invalidRequest)
                    return
                case 500...599:
                    completionHandler(nil, APIError.server)
                    return
                default:
                    break
                }
            }
            
            guard let data = data else {
                completionHandler(nil, APIError.server)
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let object = try decoder.decode(T.self, from: data)
                completionHandler(object, nil)
            } catch {
                completionHandler(nil, error)
                return
            }
        }
        task.resume()
    }
}