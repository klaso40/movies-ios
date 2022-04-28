//
//  MovieTitleView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import SwiftUI

struct MovieTitleView: View {
    let movie: Movie?
    var body: some View {
        HStack{
            Text(movie?.name ?? "")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
        }
    }
}

struct MovieTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTitleView(movie: MockData.movies.first!)
    }
}
