//
//  MovieCastList.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import SwiftUI

struct MovieCastList: View {
    let cast: [Actor]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Cast")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(cast) { actorItem in
                        ActorListItemView(actor: actorItem)
                    }
                }.padding(.horizontal)
                Spacer()
            }
            
        }
    }
}

struct MovieCastList_Previews: PreviewProvider {
    static var previews: some View {
        MovieCastList(
            cast: MockData.movies.first!.cast!
        )
    }
}
