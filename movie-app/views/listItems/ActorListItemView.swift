//
//  ActorListItemView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import SwiftUI

struct ActorListItemView: View {
    let actor: Actor
    var body: some View {
        VStack {
            AsyncImage(url: actor.profilePhoto) { phase in
                if let image = phase.image {
                    image.resizable()
                } else if let _ = phase.error {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 70, height: 70)
            Text(actor.name)
                .font(.caption)
                .foregroundColor(.white)
                .fontWeight(.semibold)
            Text(actor.characterName)
                .font(.caption2)
                .foregroundColor(.white)
        }.frame(minWidth: 70, maxWidth: 80, minHeight: 70)
    }
}

struct ActorListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ActorListItemView(
            actor: MockData.movies.first!.cast!.first!
        )
    }
}
