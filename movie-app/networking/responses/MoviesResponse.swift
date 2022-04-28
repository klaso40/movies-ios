//
//  MoviesResponse.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import Foundation

struct MoviesResponse: Decodable {
    let popularMovies: [Movie]
    let topRatedMovies: [Movie]
    let nowPlayingMovies: [Movie]
    let upcomingMovies: [Movie]
}
