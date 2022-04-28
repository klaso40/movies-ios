//
//  ContentView.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 14/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                HomeScreen()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                FavoritesScreen()
                    .tabItem {
                        Label("Favorites", systemImage: "suit.heart")
                    }
            
                MoviesScreen()
                    .tabItem {
                        Label("Movies", systemImage: "film")
                    }
                
               SearchScreen()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
            }.statusBar(hidden: true)
            NetworkStatusView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
