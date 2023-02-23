//
//  MovieController.swift
//  MoveListDataBase
//
//  Created by Matthew Hill on 2/23/23.
//

import UIKit

class MovieController {
    
    static func fetchMovieWith(searchTerm: String, completion: @escaping ([Movie]?) -> Void) {
        
        // construct URL
        guard let baseURL = URL(string: Constants.MovieURL.movieBaseURL) else { completion(nil) ; return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let apiKeyQuery = URLQueryItem(name: Constants.MovieURL.apiKeyKey, value: Constants.MovieURL.apiKeyValue)
        let searchQuery = URLQueryItem(name: Constants.MovieURL.movieQueryKey, value: searchTerm)
        let filterQuery = URLQueryItem(name: Constants.MovieURL.adultQueryKey, value: Constants.MovieURL.adultFilterValue)
        urlComponents?.queryItems = [apiKeyQuery, searchQuery, filterQuery]
        
        guard let finalURL = urlComponents?.url else {completion(nil) ; return}
        print(finalURL)
        
        // fetch data with URL
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard let data = data else { completion(nil) ; return}
            
            do {
                let topLevel = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any]
                
                guard let movieArray = topLevel?["results"] as? [[String : Any]] else { completion(nil); return }
                
                let movies = movieArray.compactMap {Movie(dictionary: $0)}
                completion(movies)
            } catch {
                print(error.localizedDescription)
                completion(nil)
                return
            }
        } .resume()
    }

    static func fetchMovieImage(forMovie: Movie, completion: @escaping (UIImage?) -> Void) {
    
        guard let baseURL = URL(string: Constants.MovieURL.imageBaseURL) else { completion(nil) ;  return}
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path.append(contentsOf: forMovie.imagePath)
        guard let finalURL = urlComponents?.url else { completion(nil); return }
        print(finalURL)
        
        // Data Tasking
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard let data = data else { completion(nil); return}
            
            let poster = UIImage(data: data)
            completion(poster)
        } .resume()
    }
}
