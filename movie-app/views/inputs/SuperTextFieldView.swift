//
//  SuperTextFieldView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 16/04/2022.
//

import SwiftUI

// Source: https://medium.com/app-makers/how-to-use-textfield-in-swiftui-2fc0ca00f75b

struct SuperTextFieldView: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
    
}

struct SuperTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SuperTextFieldView(
            placeholder: Text("Placeholder"),
            text: .constant("")
        )
    }
}
