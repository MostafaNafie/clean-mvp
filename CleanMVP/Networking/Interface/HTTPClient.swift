//
//  HTTPClient.swift
//  CleanMVP
//
//  Created by Mostafa Nafie on 20/10/2022.
//

import Foundation

public protocol HTTPClient {
    func perform<T: Decodable>(_ urlRequest: URLRequest, completion: @escaping (Result<T, Error>) -> ())
}
