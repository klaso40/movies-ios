//
//  MovieSheetViewVM.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import Foundation

class MovieSheetViewVM: ObservableObject {
    @Published var movie: Movie
    @Published var isLoading = false
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func getMovieDetail() {
        print(movie.id)
        NetworkManager.session
            .request(MoviesRouter.find(movieID: movie.id))
            .validate()
            .responseDecodable(of: Movie.self) { response in
                defer {
                    self.isLoading = false
                }
                switch response.result {
                case .success(let movie):
                    self.movie = movie
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
}
