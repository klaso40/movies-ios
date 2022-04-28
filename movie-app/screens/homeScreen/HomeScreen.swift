//
//  MoviesScreen.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 14/04/2022.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var homeScreenVM = HomeScreenVM()
    var body: some View {
        BackgroundView {
            VStack {
                NavigationBarView(title: "Home 🍿")
                if homeScreenVM.isLoading {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else if (homeScreenVM.networkError != nil) {
                    NetworkErrorView(
                        onRetryBtnClick: homeScreenVM.fetchMovies
                    )
                } else {
                    ScrollView {
                        VStack(spacing: 30) {
                            MoviesListView(
                                listName: "Top rated",
                                movies: homeScreenVM.topRatedMovies,
                                onMovieClick: { movie in
                                    homeScreenVM.selectedMovie = movie
                                }
                            )
                            MoviesListView(
                                listName: "Popular",
                                movies: homeScreenVM.popularMovies,
                                onMovieClick: { movie in
                                    homeScreenVM.selectedMovie = movie
                                }
                                
                            )
                            MoviesListView(
                                listName: "Now playing",
                                movies: homeScreenVM.nowPlayingMovies,
                                onMovieClick: { movie in
                                    homeScreenVM.selectedMovie = movie
                                }
                            )
                            MoviesListView(
                                listName: "Upcoming",
                                movies: homeScreenVM.upcomingMovies,
                                onMovieClick: { movie in
                                    homeScreenVM.selectedMovie = movie
                                }
                            )
                        }
                    }

                }
                Spacer()
            }
        }
        .movieDetailFullScreenCover(selectedMovie: $homeScreenVM.selectedMovie)
        .onAppear(perform: {
            homeScreenVM.fetchMovies()
        })
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
