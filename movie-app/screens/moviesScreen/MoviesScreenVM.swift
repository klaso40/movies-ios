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
    
    init() {
        NetworkManager.reachibilityManager?.startListening(
            onQueue: DispatchQueue.main,
            onUpdatePerforming: { status in
                print("From init \(status)")
                if (status == .reachable(.cellular) || status  == .reachable(.ethernetOrWiFi)) && self.networkError != nil {
                    self.fetchMovies()
                    self.networkError = nil
                }
            })
    }
    
    private var page = 1
    
    func onGenreChange() {
        page = 1
        movies = []
        fetchMovies()
    }
    
    func fetchMovies() {
        isLoading = true
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
                    print(err.responseCode)
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
