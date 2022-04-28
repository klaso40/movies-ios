//
//  FavoriteMoviesDataStorage.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 23/04/2022.
//

import Foundation
import CoreData
import SwiftUI

class FavoriteMoviesDataStorage {
    let moc: NSManagedObjectContext
    let favoriteMovies: FetchedResults<FavoriteMovie>
    
    init(moc: NSManagedObjectContext, favoriteMovies: FetchedResults<FavoriteMovie>) {
        self.moc = moc
        self.favoriteMovies = favoriteMovies
    }
    
    func addToFavorites(_ movie: Movie) {
        let newFavoriteMovie = FavoriteMovie(context: moc)
        newFavoriteMovie.id = Int32(movie.id)
        newFavoriteMovie.name = movie.name
        newFavoriteMovie.posterURL = movie.posterURL.absoluteString
        newFavoriteMovie.backdropURL = movie.backdropURL.absoluteString
        newFavoriteMovie.rating = movie.rating
        newFavoriteMovie.overview = movie.overview
        try? moc.save()
    }
    
    func removeFromFavorites(_ movie: Movie) {
        let favoriteMovie = favoriteMovies.first { favoriteMovie in
            favoriteMovie.id == movie.id
        }
        if let favoriteMovie = favoriteMovie {
            moc.delete(favoriteMovie)
        }
        
        try? moc.save()
    }
    
    func isFavorite(_ movie: Movie) -> Bool {
        return favoriteMovies.contains(where: { favoriteMovie in
            favoriteMovie.id == movie.id
        })
    }
    
}
