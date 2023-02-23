//
//  Constants.swift
//  MoveListDataBase
//
//  Created by Matthew Hill on 2/23/23.
//

import Foundation

struct Constants {
    
    struct MovieURL {
        static let movieBaseURL = "https://api.themoviedb.org/3/search/movie"
        static let imageBaseURL = "https://image.tmdb.org/t/p/w500"
        static let apiKeyKey = "api_key"
        static let apiKeyValue = "d04c2347c00d3b06bcb03fde515489f9"
        static let movieQueryKey = "query"
        static let adultQueryKey = "include_adult"
        static let adultFilterValue = "false"
    }
}
