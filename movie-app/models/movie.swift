//
//  movie.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 14/04/2022.
//

import Foundation

struct Movie: Identifiable, Encodable, Decodable, Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let posterURL: URL
    let backdropURL: URL
    let rating: Float
    let overview: String
    let genres: [Genre]?
    let releaseDate: String?
    let runtime: Int?
    let budget: String?
    let cast: [Actor]?
    
    init(id: Int, name: String, posterURL: URL, backdropURL: URL, rating: Float, overview: String) {
        self.id = id
        self.name = name
        self.posterURL = posterURL
        self.backdropURL = backdropURL
        self.rating = rating
        self.overview = overview
        self.genres = nil
        self.releaseDate = nil
        self.runtime = nil
        self.budget = nil
        self.cast = nil
    }
    
    init(id: Int, name: String, posterURL: URL, backdropURL: URL, rating: Float, overview: String, genres: [Genre]?, releaseDate: String?, runtime: Int?, budget: String?, cast: [Actor]?) {
        self.id = id
        self.name = name
        self.posterURL = posterURL
        self.backdropURL = backdropURL
        self.rating = rating
        self.overview = overview
        self.genres = genres
        self.releaseDate = releaseDate
        self.runtime = runtime
        self.budget = budget
        self.cast = cast
    }
    
    var ratingFilledStarsCount: Int {
        return Int(floor(rating))
    }
    
    var ratingOutlinedStarsCount: Int {
        return 5 - ratingFilledStarsCount - ratingHalfFilledStarsCount
    }
    
    var ratingHalfFilledStarsCount: Int {
        return (rating - Float(ratingFilledStarsCount) == 0) ? 0 : 1
    }
}


