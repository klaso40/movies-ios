//
//  MovieGenreFilter.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 23/04/2022.
//

import SwiftUI

struct MovieGenreFilter: View {
    @Binding var selectedGenreFilter: GenreLabel
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Genre")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(availableGenres, id: \.self) { genreLabel in
                        VStack {
                            Text(genreLabel.emoji)
                                .padding(.bottom, 1)
                            Text(genreLabel.genre.name)
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                            .frame(width: 70, height: 70)
                            .background(selectedGenreFilter == genreLabel ? Color.teal : Color.mySecondary)
                            .cornerRadius(20)
                            .onTapGesture {
                                selectedGenreFilter = genreLabel
                            }
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct MovieGenreFilter_Previews: PreviewProvider {
    static var previews: some View {
        MovieGenreFilter(
            selectedGenreFilter: .constant(availableGenres.first!)
        )
    }
}
