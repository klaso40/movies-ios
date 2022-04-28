//
//  MoviesListView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 14/04/2022.
//

import SwiftUI

struct MoviesListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [])
    private var favoriteMovies: FetchedResults<FavoriteMovie>
    
    let listName: String
    let movies: [Movie]
    let onMovieClick: (_ movie: Movie) -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(listName)
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movies) { movie in
                        MovieView(
                            movie: movie,
                            favoriteMoviesDataStorage: FavoriteMoviesDataStorage(
                                moc: moc,
                                favoriteMovies: favoriteMovies
                            )
                        )
                            .padding(.horizontal)
                            .onTapGesture {
                                onMovieClick(movie)
                            }
                    }
                }
                
            }
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(
            listName: "Top movies",
            movies: MockData.movies,
            onMovieClick: { movie in
                print(movie)
            }
        )
    }
}
