//
//  view.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 28/04/2022.
//

import Foundation


import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
