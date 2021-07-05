//
//  NetworkService.swift
//  BeerListApp
//
//  Created by admin on 25.06.2021.
//

import Foundation

protocol Networking {
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {
   
    func request(path: String, params: [String : String], completion: @escaping (Data?, Error?) -> Void) {
        let allParams = params
        let url = self.url(from: path, params: allParams)
        guard let url = url else { return }
        let request = URLRequest(url: url)
        createDataTask(from: request, completion: completion).resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    private func url(from path: String, params: [String: String]) -> URL? {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.beerlist
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url
    }
}
