//
//  MovieView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 14/04/2022.
//

import SwiftUI
import CoreData
struct MovieView: View {
    let movie: Movie
    let favoriteMoviesDataStorage: FavoriteMoviesDataStorage
    
    var isFavorite: Bool {
        return favoriteMoviesDataStorage.isFavorite(movie)
    }

    
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: movie.posterURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                    } else if let _ = phase.error {
                        VStack {
                            Image(systemName: "exclamationmark.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.red)
                            Text("Image could not be loaded!")
                                .fontWeight(.medium)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                        }
                        
                    } else {
                        ProgressView()
                    }
                    
                }
                    .shadow(radius: 20)
                    .cornerRadius(20)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.red)
                            .shadow(radius: 20)
                            .padding()
                            .onTapGesture {
                                if isFavorite {
                                    favoriteMoviesDataStorage.removeFromFavorites(movie)
                                } else {
                                    favoriteMoviesDataStorage.addToFavorites(movie)
                                }
                               
                            }
                    }
                }
            }
               
            Text(movie.name)
                .fontWeight(.bold)
                .truncationMode(.tail)
                // .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .lineLimit(1)
            MovieRatingView(movie: movie)
        }
            .frame(width: 150, height: 280)
           
    }
}

//struct MovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieView(
//            movie: MockData.movies.first!,
//            moc: NSManagedObjectContext(),
//            favoriteMovies: Set<FavoriteMovie>()
//            // isFavorite: true
//        )
//    }
//}
