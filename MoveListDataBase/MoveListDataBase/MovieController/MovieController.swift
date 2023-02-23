//
//  MovieController.swift
//  MoveListDataBase
//
//  Created by Matthew Hill on 2/23/23.
//

import Foundation

class MovieController {
    
    static func fetchMovieWith(searchTerm: String, completion: @escaping ([Movie]?) -> Void) {
        
        // construct URL
        guard let baseURL = URL(string: Constants.MovieURL.movieBaseURL) else { completion(nil) ; return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let apKeyQuery = URLQueryItem(name: Constants.MovieURL.apiKeyKey, value: Constants.MovieURL.apiKeyValue)
        let searchQuery = URLQueryItem(name: Constants.MovieURL.movieQueryKey, value: searchTerm)
        let filterQuery = URLQueryItem(name: Constants.MovieURL.adultQueryKey, value: Constants.MovieURL.adultFilterValue)
        
        guard let finalURL = urlComponents?.url else {completion(nil) ; return}
        print(finalURL)
    }
}
