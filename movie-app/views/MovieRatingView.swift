//
//  MovieRatingView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 26/04/2022.
//

import SwiftUI

struct MovieRatingView: View {
    let movie: Movie
    var body: some View {
        HStack {
            ForEach(0..<movie.ratingFilledStarsCount, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            ForEach(0..<movie.ratingHalfFilledStarsCount, id: \.self) { _ in
                Image(systemName: "star.leadinghalf.filled")
                    .foregroundColor(.yellow)
            }
            ForEach(0..<movie.ratingOutlinedStarsCount, id: \.self) { _ in
                Image(systemName: "star")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct MovieRatingView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRatingView(
            movie: MockData.movies.first!
        )
    }
}
