//
//  constants.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 23/04/2022.
//

import Foundation

let defaultMovieImageURL: URL = URL(string:"https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80")!

let networkScheme = "http"
let networkHost = "localhost"
let networkPort = 3000


let availableGenres = [
    GenreLabel(
        emoji: "😱",
        genre: Genre(
            id: 27,
            name: "Horror"
        )
    ),
    GenreLabel(
        emoji: "😅",
        genre: Genre(
            id: 35,
            name: "Comedy"
        )
    ),
    GenreLabel(
        emoji: "🥰",
        genre: Genre(
            id: 10749,
            name: "Romance"
        )
    ),
    GenreLabel(
        emoji: "😬",
        genre: Genre(
            id: 18,
            name: "Drama"
        )
    ),
    GenreLabel(
        emoji: "👽",
        genre: Genre(
            id: 14,
            name: "Fantasy"
        )
    ),
    GenreLabel(
        emoji: "😎",
        genre: Genre(
            id: 28,
            name: "Action"
        )
    ),
    GenreLabel(
        emoji: "😶‍🌫️",
        genre: Genre(
            id: 9648,
            name: "Mystery"
        )
    ),
    GenreLabel(
        emoji: "🤠",
        genre: Genre(
            id: 37,
            name: "Western"
        )
    )
]
