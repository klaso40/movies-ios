//
//  NavigationBarView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 16/04/2022.
//

import SwiftUI

struct NavigationBarView: View {
    let title: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.teal)
            }.padding()
            
            Divider()
                .background(.tint)
                .padding(.bottom)
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(
            title: "My title"
        )
    }
}
