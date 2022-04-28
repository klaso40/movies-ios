//
//  MoviesSearchField.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 23/04/2022.
//

import SwiftUI

struct MoviesSearchField: View {
    @Binding var searchText: String
    @Binding var isLoading: Bool
    
    var body: some View {
        SuperTextFieldView(
            placeholder: Text("Search your movie...").foregroundColor(.gray),
            text: $searchText
        )
            .clearButton($searchText)
            .progressIndicator($isLoading)
            .padding()
            .background(Color.mySecondary)
            .cornerRadius(20)
    }
}

struct MoviesSearchField_Previews: PreviewProvider {
    static var previews: some View {
        MoviesSearchField(
            searchText: .constant(""),
            isLoading: .constant(false)
        )
    }
}
