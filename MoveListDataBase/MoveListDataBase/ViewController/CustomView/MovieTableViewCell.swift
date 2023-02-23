//
//  MovieTableViewCell.swift
//  MoveListDataBase
//
//  Created by Matthew Hill on 2/23/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - Functions
    func updateViews(movie: Movie) {
        
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = String(movie.rating)
        descriptionLabel.text = movie.description
        fetchPoster(forMovie: movie)
    }
    
    func fetchPoster(forMovie: Movie) {
        MovieController.fetchMovieImage(forMovie: forMovie) { poster in
            DispatchQueue.main.async {
                self.moviePosterImageView.image = poster
            }
        }
    }
   
}


