//
//  NetworkingRequest.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

protocol NetworkingRequest {
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String] { get }
    var body: Data? { get }
    var queryItems: [URLQueryItem]? { get }
    
    func buildURLRequest() -> URLRequest
}

extension NetworkingRequest {
    var method: HTTPMethod { .GET }
    var body: Data? { nil }
    
    func buildURLRequest() -> URLRequest {
        var urlComponents = URLComponents(string: NetworkingConstants.baseURL)!
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: NetworkingConstants.apiKey)
        ]
        if let queryItems = queryItems {
            urlComponents.queryItems?.append(contentsOf: queryItems)
        }
        let baseURL = urlComponents.url!
        let pathURL = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: pathURL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        return urlRequest
    }
}
