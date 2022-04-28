//
//  DataController.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 23/04/2022.
//

import Foundation
import CoreData

// Source: https://www.youtube.com/watch?v=bvm3ZLmwOdU
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Movies")
    
    init() {
        container.loadPersistentStores { description, err in
            if let err = err {
                print("Core data failed to load \(err.localizedDescription)")
            }
        }
    }
}
