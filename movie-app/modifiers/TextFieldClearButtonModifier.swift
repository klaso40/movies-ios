//
//  TextFieldClearButtonModifier.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 23/04/2022.
//

// Source: https://www.hackingwithswift.com/forums/100-days-of-swift/adding-a-clear-button-to-a-textfield/12079
import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var fieldText: String

    func body(content: Content) -> some View {
        content
            .padding(.trailing, 35)
            .overlay {
                if !fieldText.isEmpty {
                    HStack {
                        Spacer()
                        Button {
                            fieldText = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                        }
                        .foregroundColor(.secondary)
                        .padding(.trailing, 4)
                    }
                }
            }
    }
}

extension View {
    func clearButton(_ text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(fieldText: text))
    }
}
