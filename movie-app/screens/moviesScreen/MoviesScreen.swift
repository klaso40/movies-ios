//
//  MoviesScreen.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 25/04/2022.
//

import SwiftUI

struct MoviesScreen: View {
    @StateObject private var moviesScreenVM = MoviesScreenVM()
    var body: some View {
        BackgroundView() {
            VStack {
                NavigationBarView(title: "Movies 🎬")
                MovieGenreFilter(selectedGenreFilter: $moviesScreenVM.selectedGenreFilter)
                
                if moviesScreenVM.networkError != nil {
                    NetworkErrorView(onRetryBtnClick: moviesScreenVM.fetchMovies)
                } else {
                    VStack {
                        ScrollView {
                            VStack {
                                MoviesGrid(
                                    movies: moviesScreenVM.movies,
                                    selectedMovie: $moviesScreenVM.selectedMovie,
                                    onMovieAppear: { movie in
                                        moviesScreenVM.tryFetchMoreMovies(currentVisibleMovie: movie)
                                    }
                                )
                                if moviesScreenVM.isLoading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                        .padding()
                                }
                            }
                        }
                    }
                        .padding(.horizontal)
                        .padding(.top)
                }
                Spacer()
            }
        }
        .movieDetailFullScreenCover(selectedMovie: $moviesScreenVM.selectedMovie)
        .onReceive(moviesScreenVM.$selectedGenreFilter.dropFirst(), perform: { _ in
            moviesScreenVM.onGenreChange()
        })
        .onAppear {
            if moviesScreenVM.movies.isEmpty {
                moviesScreenVM.fetchMovies()
            }
        }
    }
}

struct MoviesScreen_Previews: PreviewProvider {
    static var previews: some View {
        MoviesScreen()
    }
}
