//
//  MoviesScreenVM.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 25/04/2022.
//

import Foundation
import Alamofire

class MoviesScreenVM: ObservableObject {
    @Published var selectedGenreFilter: GenreLabel = availableGenres.first!
    @Published var selectedMovie: Movie?
    @Published var isLoading = true
    @Published var movies: [Movie] = []
    @Published var networkError: AFError?
    
    private let errorReachabilityManager = NetworkReachabilityManager(host: "www.google.com")
    private var page = 1
    
    deinit {
        errorReachabilityManager?.stopListening()
    }
    
    func onGenreChange() {
        page = 1
        movies = []
        fetchMovies()
    }
    
    func waitForReachableNetworkAndTryAgain() {
        errorReachabilityManager?.startListening(onUpdatePerforming: { status in
            if status == .reachable(.ethernetOrWiFi) || status == .reachable(.cellular) {
                self.fetchMovies()
                self.errorReachabilityManager?.stopListening()
            }
        })
    }
    
    func fetchMovies() {
        isLoading = true
        self.networkError = nil
        NetworkManager.session
            .request(MoviesRouter.byGenre(genre: selectedGenreFilter.genre, page: page))
            .validate()
            .responseDecodable(of: [Movie].self) { response in
                defer {
                    self.isLoading = false
                }
                switch response.result {
                case .success(let movies):
                    self.movies.append(contentsOf: movies)
                case .failure(let err):
                    self.networkError = err
                    guard let isReachable = self.errorReachabilityManager?.isReachable else {
                        return
                    }
                    if !isReachable {
                        self.waitForReachableNetworkAndTryAgain()
                    }
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
        if page * 20 == visibleMovieIndex + 1 {
            page += 1
            fetchMovies()
        }
    }
    
}
