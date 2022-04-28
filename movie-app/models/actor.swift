//
//  actor.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 18/04/2022.
//

import Foundation

struct Actor: Identifiable, Encodable, Decodable {
    let id: Int
    let name: String
    let characterName: String
    let profilePhoto: URL
}
