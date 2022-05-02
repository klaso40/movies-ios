//
//  MoviesScreenVM.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 16/04/2022.
//

import Foundation
import Alamofire

class HomeScreenVM: ObservableObject {
    @Published var selectedMovie: Movie?
    @Published var popularMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    @Published var nowPlayingMovies: [Movie] = []
    @Published var isLoading = true
    @Published var networkError: AFError?
    
    private let errorReachabilityManager = NetworkReachabilityManager(host: "www.google.com")

    func waitForReachableNetworkAndTryAgain() {
        errorReachabilityManager?.startListening(onUpdatePerforming: { status in
            if status == .reachable(.ethernetOrWiFi) || status == .reachable(.cellular) {
               
                self.fetchMovies()
                self.errorReachabilityManager?.stopListening()
            }
        })
    }
    
    deinit {
        errorReachabilityManager?.stopListening()
    }

    
    func fetchMovies() {
        self.networkError = nil
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
                    self.networkError = error
                    guard let isReachable = self.errorReachabilityManager?.isReachable else {
                        return
                    }
                    if !isReachable {
                        self.waitForReachableNetworkAndTryAgain()
                    }
                }
            }
    }
}
