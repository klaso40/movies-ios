//
//  SearchScreen.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 14/04/2022.
//

import SwiftUI

struct SearchScreen: View {
    @StateObject private var searchScreenVM = SearchScreenVM()
    
    var body: some View {
        BackgroundView {
            VStack {
                NavigationBarView(title: "Search 🔎")
                if searchScreenVM.networkError != nil {
                    NetworkErrorView(onRetryBtnClick: searchScreenVM.fetchMovies)
                } else {
                    VStack {
                        MoviesSearchField(
                            searchText: $searchScreenVM.searchText,
                            isLoading: $searchScreenVM.isLoading
                        )
                        ScrollView {
                            VStack {
                                HStack {
                                    Text(searchScreenVM.isSearchTextEmpty ? "Most popular movies" : "Results for: \(searchScreenVM.trimmedSearchText)")
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                MoviesGrid(
                                    movies: searchScreenVM.movies,
                                    selectedMovie: $searchScreenVM.selectedMovie,
                                    onMovieAppear: { visibleMovie in
                                        searchScreenVM.tryFetchMoreMovies(currentVisibleMovie: visibleMovie)
                                    }
                                )
                            }
                        }
                        
                    }.padding(.horizontal)
                }
                
                Spacer()
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
        .movieDetailFullScreenCover(selectedMovie: $searchScreenVM.selectedMovie)
        .onReceive(searchScreenVM.$searchText.dropFirst(), perform: { _ in
            searchScreenVM.onSearchTextChange()
        })
        .onAppear(perform: {
            if searchScreenVM.movies.isEmpty {
                searchScreenVM.fetchMovies()
            }
        })
        
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
