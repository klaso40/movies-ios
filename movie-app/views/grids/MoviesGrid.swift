//
//  MoviesGrid.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 23/04/2022.
//

import SwiftUI

struct MoviesGrid: View {
    let movies: [Movie]
    @Binding var selectedMovie: Movie?
    var onMovieAppear: ((_ movie: Movie) -> Void)?
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [])
    private var favoriteMovies: FetchedResults<FavoriteMovie>
    
    init(movies: [Movie], selectedMovie: Binding<Movie?>) {
        self._selectedMovie = selectedMovie
        self.movies = movies
    }
    
    init(movies: [Movie], selectedMovie: Binding<Movie?>, onMovieAppear: @escaping (_ movie: Movie) -> Void) {
        self._selectedMovie = selectedMovie
        self.onMovieAppear = onMovieAppear
        self.movies = movies
    }
    
    init(movies: [Movie]) {
        self.movies = movies
        self.onMovieAppear = nil
        self._selectedMovie = .constant(nil)
    }
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20 ) {
            ForEach(movies) { movie in
                MovieView(
                    movie: movie,
                    favoriteMoviesDataStorage: FavoriteMoviesDataStorage(
                        moc: moc,
                        favoriteMovies: favoriteMovies
                    )
                )
                    .onAppear {
                        if let onMovieAppear = onMovieAppear {
                            onMovieAppear(movie)
                        }
                    }
                    .onTapGesture {
                        selectedMovie = movie
                    }
            }
        }
    }
}

struct MoviesGrid_Previews: PreviewProvider {
    static var previews: some View {
        MoviesGrid(
            movies: MockData.movies
        )
    }
}
