//
//  genre.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import Foundation

struct Genre: Identifiable, Decodable, Encodable, Hashable {
    let id: Int
    let name: String
}
