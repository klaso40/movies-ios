//
//  FavoritesScreen.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 14/04/2022.
//

import SwiftUI

struct FavoritesScreen: View {
    @StateObject private var favoritesScreenVM = FavoritesScreenVM()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name)
    ]) var favoriteMoviesResult: FetchedResults<FavoriteMovie>
    
    var favoriteMovies: [Movie] {
        return favoriteMoviesResult.map { favoriteMovie in
            return Movie(
                id: Int(favoriteMovie.id),
                name: favoriteMovie.name ?? "Unknow name",
                posterURL: favoriteMovie.posterURL != nil ? URL(string: favoriteMovie.posterURL!)! : defaultMovieImageURL,
                backdropURL: favoriteMovie.backdropURL != nil ? URL(string: favoriteMovie.backdropURL!)! : defaultMovieImageURL,
                rating: favoriteMovie.rating,
                overview: favoriteMovie.overview ?? ""
            )
        }
    }
    
    var body: some View {
        BackgroundView {
            VStack {
                NavigationBarView(title: "Favorites ❤️")
                if favoriteMovies.isEmpty {
                    VStack {
                        Spacer()
                        Image("empty_state")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        Text("Your favorite movies will be displayed here!")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    
                        
                } else {
                    ScrollView {
                        MoviesGrid(
                            movies: favoriteMovies,
                            selectedMovie: $favoritesScreenVM.selectedMovie
                        )
                    }
                }
                
            }
        }.movieDetailFullScreenCover(selectedMovie: $favoritesScreenVM.selectedMovie)
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}
