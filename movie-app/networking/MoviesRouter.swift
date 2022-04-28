//
//  MoviesRouter.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 16/04/2022.
//

import Foundation
import Alamofire
import SwiftUI

enum MoviesRouter: URLRequestConvertible {
    case get
    case find(movieID: Int)
    case byGenre(genre: Genre, page: Int)
    case search(query: String, page: Int)
    case popular
    
    var method: HTTPMethod {
        switch self {
        case .get, .find, .byGenre, .search, .popular: return .get
        }
    }
    
    var path: String {
        switch self {
        case .get: return "/movies"
        case .find(let movieID): return "/movies/detail/\(String(movieID))"
        case .byGenre: return "/movies/filter"
        case .search: return "/movies/search"
        case .popular: return "/movies/popular"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .get, .find, .popular: return []
        case .byGenre(let genre, let page):
            return [
                URLQueryItem(name: "genre_id", value: String(genre.id)),
                URLQueryItem(name: "page", value: String(page))
            ]
        case .search(let query, let page):
            return [
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "page", value: String(page))
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "localhost"
        urlComponents.port = 3000
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        var request = URLRequest(url: urlComponents.url!)
        request.method = method
        return request
    }
}

