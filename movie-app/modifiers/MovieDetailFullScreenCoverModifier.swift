//
//  MovieDetailFullScreenCoverModifier.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 26/04/2022.
//

import SwiftUI

struct MovieDetailFullScreenCoverModifier: ViewModifier {
    @Binding var selectedMovie: Movie?
    func body(content: Content) -> some View {
        content
            .fullScreenCover(item: $selectedMovie) { movie in
                MovieSheetView(
                    movieSheetViewVM: MovieSheetViewVM(
                        movie: movie
                    ),
                    onDismissBtnClik: {
                        selectedMovie = nil
                    }
                )
            }
    }
}

extension View {
    func movieDetailFullScreenCover(selectedMovie: Binding<Movie?>) -> some View {
        return self
            .modifier(MovieDetailFullScreenCoverModifier(selectedMovie: selectedMovie))
    }
}
