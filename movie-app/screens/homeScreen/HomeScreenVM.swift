//
//  MoviesScreenVM.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 16/04/2022.
//

import Foundation

class HomeScreenVM: ObservableObject {
    @Published var selectedMovie: Movie?
    @Published var popularMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    @Published var nowPlayingMovies: [Movie] = []
    @Published var isLoading = true

    
    
    func fetchMovies() {
        isLoading = true
        NetworkManager.session
            .request(MoviesRouter.get)
            .validate()
            .responseDecodable(of: MoviesResponse.self) { response in
                defer {
                    self.isLoading = false
                }
                switch response.result {
                case .success(let moviesResponse):
                    self.popularMovies = moviesResponse.popularMovies
                    self.topRatedMovies = moviesResponse.topRatedMovies
                    self.upcomingMovies = moviesResponse.upcomingMovies
                    self.nowPlayingMovies = moviesResponse.nowPlayingMovies
                case .failure(let error):
                    print(NetworkManager.isInternetAvailable)
                    print(error.responseCode)
                    print(error.localizedDescription)
                }
            }
    }
}
