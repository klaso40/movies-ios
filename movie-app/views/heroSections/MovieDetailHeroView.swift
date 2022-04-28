//
//  MovieDetailHeroView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import SwiftUI

struct MovieDetailHeroView: View {
    @Binding var movie: Movie
    let onDismissBtnClik: () -> Void
    let favoriteMoviesDataStorage: FavoriteMoviesDataStorage
    
    var isFavorite: Bool {
        return favoriteMoviesDataStorage.isFavorite(movie)
    }
    var body: some View {
        ZStack {
            AsyncImage(url: movie.backdropURL) { phase in
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
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 250)
            .overlay(
                Rectangle()
                    .shadow(radius: 50)
                    .background(Color.black)
                    .opacity(0.25)
            )
            .clipped()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        onDismissBtnClik()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.teal)
                            .padding(.top, 30)
                            // .padding(.trailing, 25)
                    }
                }
                Spacer()
                HStack {
                    Text(movie.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.red)
                        .shadow(radius: 20)
                        .onTapGesture {
                            if isFavorite {
                                favoriteMoviesDataStorage.removeFromFavorites(movie)
                            } else {
                                favoriteMoviesDataStorage.addToFavorites(movie)
                            }
                        }
                }.padding(.vertical)
            }.padding(.horizontal, 45)
            
        }.frame(maxWidth: .infinity, maxHeight: 250)
    }
}

//struct MovieDetailHeroView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailHeroView(
//            movie: .constant(MockData.movies.first!),
//            onDismissBtnClik: {},
//        )
//    }
//}
