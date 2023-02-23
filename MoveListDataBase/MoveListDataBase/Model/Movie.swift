//
//  Movie.swift
//  MoveListDataBase
//
//  Created by Matthew Hill on 2/23/23.
//

import Foundation

class Movie {
    
    let title: String
    let description: String
    let imagePath: String
    let rating: Double
    
    init(title: String, description: String, imagePath: String, rating: Double) {
        self.title = title
        self.description = description
        self.imagePath = imagePath
        self.rating = rating
    }
    
}

extension Movie {
    
    enum Keys: String {
        case title
        case description = "overview"
        case imagePath = "poster_path"
        case rating = "vote_average"
    }
    
    convenience init?(dictionary: [String: Any]) {
        guard let title = dictionary[Keys.title.rawValue] as? String,
              let description = dictionary[Keys.description.rawValue] as? String,
              let imagePath = dictionary[Keys.imagePath.rawValue] as? String,
              let rating = dictionary[Keys.rating.rawValue] as? Double else {
            print("Failed to initialize a Movie object from a dictionary")
            return nil
            }
        
        self.init(title: title, description: description, imagePath: imagePath, rating: rating)
    }
}
