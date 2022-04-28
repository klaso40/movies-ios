//
//  TextFiledProgressIndicatorModifier.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 26/04/2022.
//

import SwiftUI

struct TextFiledProgressIndicatorModifier: ViewModifier {
    @Binding var isLoading: Bool
    func body(content: Content) -> some View {
        content
            .padding(.trailing, isLoading ? 35 : 0     )
            .overlay {
                if isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .foregroundColor(.secondary)
                            .padding(.trailing, 4)
                    }
                }
            }
    }
}


extension View {
    func progressIndicator(_ isLoading: Binding<Bool>) -> some View {
        return self.modifier(TextFiledProgressIndicatorModifier(isLoading: isLoading))
    }
}
