//
//  MovieSheetView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 14/04/2022.
//

import SwiftUI

struct MovieSheetView: View {
    @ObservedObject var movieSheetViewVM: MovieSheetViewVM
    let onDismissBtnClik: () -> Void
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: []) var favoriteMovies: FetchedResults<FavoriteMovie>

    var body: some View {
        BackgroundView {
            VStack {
                MovieDetailHeroView(
                    movie: $movieSheetViewVM.movie,
                    onDismissBtnClik: onDismissBtnClik,
                    favoriteMoviesDataStorage: FavoriteMoviesDataStorage(
                        moc: moc,
                        favoriteMovies: favoriteMovies
                    )
                )
                if movieSheetViewVM.isLoading {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    ScrollView {
                        VStack(spacing: 10) {
                            MovieTitleView(movie: movieSheetViewVM.movie)
                                .padding(.horizontal)
                            HStack {
                                MovieRatingView(movie: movieSheetViewVM.movie)
                                Spacer()
                            }.padding(.horizontal)
                           
                            if let movie = movieSheetViewVM.movie {
                                MovieDescriptionList(
                                    runtime: movie.runtime,
                                    releaseDate: movie.releaseDate,
                                    budget: movie.budget
                                )
                                    .padding(.horizontal)
                            }
                            MovieGenresList(
                                genres: movieSheetViewVM.movie.genres ?? []
                            ).padding(.horizontal)
                            
                            if let cast = movieSheetViewVM.movie.cast {
                                MovieCastList(cast: cast)
                                
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Plot")
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                Text(movieSheetViewVM.movie.overview)
                                    .foregroundColor(.white)
                                    .fontWeight(.light)
                            }.padding(.horizontal)
                        }
                    }
                }
                Spacer()
            }
        }
        .onAppear(perform: {
            movieSheetViewVM.getMovieDetail()
        })
        .statusBar(hidden: true)
        .ignoresSafeArea(.all, edges: [.top])
    }
}

struct MovieSheetView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSheetView(
            movieSheetViewVM: MovieSheetViewVM(movie: MockData.movies.first!),
            onDismissBtnClik: {}
        )
    }
}
