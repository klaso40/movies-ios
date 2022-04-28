//
//  SearchScreenVM.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 23/04/2022.
//

import Foundation

class SearchScreenVM: ObservableObject {
    @Published var searchText = ""
    @Published var selectedMovie: Movie?
    @Published var isLoading = true
    @Published var movies: [Movie] = []
    
    private var page = 1
    private var debouncer: Debouncer!
    
    init () {
        debouncer = Debouncer.init(delayInSeconds: 1, callback: searchMovies)
    }
    
    var isSearchTextEmpty: Bool {
        return trimmedSearchText.isEmpty
    }
    
    var trimmedSearchText: String {
        return searchText.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
    private func searchMovies() {
        if !isSearchTextEmpty {
            page = 1
            movies = []
            print("Calling API with query \(trimmedSearchText)")
            fetchMovies(query: trimmedSearchText, page: 1)
        } else {
            fetchMostPopuplarMovies()
        }
    }
    
    func fetchMostPopuplarMovies() {
        print("Fetching most popular movies")
        NetworkManager.session
            .request(MoviesRouter.popular)
            .responseDecodable(of: [Movie].self) { response in
                defer {
                    self.isLoading = false
                }
                switch response.result {
                case .success(let popularMovies):
                    self.movies = popularMovies
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
    
    
    func onSearchTextChange() {
        isLoading = true
        debouncer.call()
    }
    
    func fetchMovies(query: String, page: Int) {
        isLoading = true
        NetworkManager.session
            .request(MoviesRouter.search(query: query, page: page))
            .responseDecodable(of: [Movie].self) { response in
                defer {
                    self.isLoading = false
                }
                switch response.result {
                case .success(let movies):
                    self.movies.append(contentsOf: movies)
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
    
    func tryFetchMoreMovies(currentVisibleMovie: Movie) {
        let visibleMovieIndex = movies.firstIndex(of: currentVisibleMovie)
        
        guard let visibleMovieIndex = visibleMovieIndex else {
            return
        }
        
        // 20 is number of movies in reposne
        if page * 20 == visibleMovieIndex + 1 && !isSearchTextEmpty {
            page += 1
            fetchMovies(query: trimmedSearchText, page: page)
        }
    }
}
