//
//  MovieGenreBadge.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import SwiftUI

struct MovieGenreBadge: View {
    let genre: String
    var body: some View {
        Text(genre)
            .font(.caption)
            .fontWeight(.light)
            .truncationMode(.tail)
            .lineLimit(1)
            .foregroundColor(.white)
            .padding(.horizontal, 14)
            .padding(.vertical, 7)
            .frame(maxWidth: .infinity)
            .background(Color.mySecondary)
            .cornerRadius(30)
            
    }
}

struct MovieGenreBadge_Previews: PreviewProvider {
    static var previews: some View {
        MovieGenreBadge(
            genre: "Drama"
        )
    }
}
