//
//  BackgroundView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 14/04/2022.
//

import SwiftUI

struct BackgroundView<Content>: View where Content : View {
    let content: () -> Content
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.background, .background.opacity(0.9)],
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
                .ignoresSafeArea()
                .overlay(
                    content()
                        
                )
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView {
            Text("My view")
                .foregroundColor(.white)
        }
    }
}
