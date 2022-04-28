//
//  ErrorView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 28/04/2022.
//

import SwiftUI

struct NetworkErrorView: View {
    let onRetryBtnClick: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Image("network_error")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Text("Sorry an error occurred 😬. \n We are doing our best to fix it!")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            Button {
                onRetryBtnClick()
            } label: {
                Text("Try again")
                    .foregroundColor(.white)
                   
                
            }.buttonStyle(.bordered)

            Spacer()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkErrorView(
            onRetryBtnClick: {
                print("retry")
            }
        )
    }
}
