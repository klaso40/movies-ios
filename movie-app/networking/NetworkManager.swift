//
//  NetworkManager.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 16/04/2022.
//

import Foundation
import Alamofire

// source:
// -- https://www.raywenderlich.com/11668143-alamofire-tutorial-for-ios-advanced-usage#toc-anchor-015
// -- https://tousu.in/qa/?qa=18464/

struct NetworkManager {
    
    static private let cacher = ResponseCacher(behavior: .cache)
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.requestCachePolicy = .useProtocolCachePolicy
        
        return Session(configuration: configuration)
    }()
    
    static let reachibilityManager = NetworkReachabilityManager(host: "www.google.com")
    
    
    static var isInternetAvailable: Bool? {
        return reachibilityManager?.isReachable
    }
}
