//
//  MovieTableViewCell.swift
//  MoveListDataBase
//
//  Created by Matthew Hill on 2/23/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    
    // MARK: - Functions
    func setConfiguration(with movie: Movie) {
        // fetch image
        var config = defaultContentConfiguration()
        config.text = movie.title
        config.secondaryText = movie.description
        config.secondaryTextProperties.numberOfLines = 4
        contentConfiguration = config
    }

}
