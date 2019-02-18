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
    
    func fetchList<T: Decodable>(_ listType: ListType, completionHandler: @escaping (T?, Error?) -> ()) {
        // http://image.tmdb.org/t/p/w185/xRWht48C2V8XNfzvPehyClOvDni.jpg -- [poster path]
        // https://api.themoviedb.org/3/genre/movie/list?api_key=d52f2a679c2747d1798778bf535c1989
        // https://api.themoviedb.org/3/now_playing?api_key=d52f2a679c2747d1798778bf535c1989
        // https://api.themoviedb.org/3/movie/upcoming?api_key=d52f2a679c2747d1798778bf535c1989&language=en-US&region=US
        // https://api.themoviedb.org/3/movie/now_playing?api_key=<<api_key>>&language=en-US&page=1
        
        // this path gets all info about a movie and its actors/ directors etc
        // https://api.themoviedb.org/3/movie/6547?api_key=d52f2a679c2747d1798778bf535c1989&language=en-US&append_to_response=credits
        
        // query upcomgin in US
//        https://api.themoviedb.org/3/movie/upcoming?api_key=d52f2a679c2747d1798778bf535c1989&language=en-US&page=1&region=US
        
        // ucpong us
//        https://api.themoviedb.org/3/movie/now_playing?api_key=d52f2a679c2747d1798778bf535c1989&language=en-US&page=1&region=US
        
        let base = APIManager.baseURL.appendingPathComponent(listType.rawValue)
        var urlComponents = URLComponents(url: base, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "region", value: "US")
            ]
        
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
    
    func fetchMovieDetails(movieId: Int, completionHandler: @escaping (MovieDetails?, Error?) -> ()) {
        // this path gets all info about a movie and its actors/ directors etc
        // https://api.themoviedb.org/3/movie/6547?api_key=d52f2a679c2747d1798778bf535c1989&language=en-US&append_to_response=credits
        
//        let baseUrlPath = "https://api.themoviedb.org/3/"
        
//        let baser = APIManager.baseURL.appendingPathComponent("movie/")
//        var urlComponentsr = URLComponents(url: baser, resolvingAgainstBaseURL: true)
//        urlComponentsr?.queryItems = [
//                URLQueryItem(name: "", value: String(describing: movieId)),
//                URLQueryItem(name: "language", value: "en-US"),
//                URLQueryItem(name: "page", value: "1"),
//                URLQueryItem(name: "region", value: "US")
//                ]
//        guard let url = urlComponents?.url else {
//            completionHandler(nil, APIError.badURL)
//            return
//        }
//        let request = URLRequest(url: url)
        
        

        let base = baseUrlPath + "movie/\(movieId)?api_key=\(apiKey)&language=en-US&append_to_response=credits,release_dates"
//        print(base)
        guard let url = URL(string: base) else {
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
                let object = try decoder.decode(MovieDetails.self, from: data)
                completionHandler(object, nil)
            } catch {
                completionHandler(nil, error)
                return
            }
        }
        task.resume()
    }
    
}



