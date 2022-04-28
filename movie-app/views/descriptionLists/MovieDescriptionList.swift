//
//  MovieDescriptionList.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import SwiftUI

struct MovieDescriptionList: View {
    let runtime: Int?
    let releaseDate: String?
    let budget: String?
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Runtime: \(runtime != nil ? String(runtime!) : "-")")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            HStack {
                Text("Release date: \(releaseDate ?? "-")")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            HStack {
                Text("Budget: \(budget ?? "-")")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
        }
    }
}

struct MovieDescriptionList_Previews: PreviewProvider {
    static var previews: some View {
        MovieDescriptionList(
            runtime: MockData.movies.first!.runtime,
            releaseDate: MockData.movies.first!.releaseDate,
            budget: MockData.movies.first!.budget
        )
    }
}
