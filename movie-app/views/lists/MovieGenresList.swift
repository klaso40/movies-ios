//
//  MovieGenresList.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import SwiftUI

struct MovieGenresList: View {
    let genres: [Genre]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(genres) { genre in
                MovieGenreBadge(genre: genre.name)
            }
            Spacer()
        }
    }
}

struct MovieGenresList_Previews: PreviewProvider {
    static var previews: some View {
        MovieGenresList(
            genres: [
                Genre(id: 1, name: "Drama"),
                Genre(id: 2, name: "Horror"),
                Genre(id: 3, name: "Drama"),
                Genre(id: 4, name: "Horror"),
                Genre(id: 5, name: "Drama"),
                Genre(id: 6, name: "Horror"),
                
            ]
        )
    }
}
