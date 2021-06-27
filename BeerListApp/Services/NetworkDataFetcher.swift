//
//  NetworkDataFetcher.swift
//  BeerListApp
//
//  Created by admin on 24.06.2021.
//

import Foundation

protocol DataFetcher {
    func getData(response: @escaping ([BeerItem]?) -> Void)
    func getNextBatch(response: @escaping ([BeerItem]?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    static var currentUrlPage = 1
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func getData(response: @escaping ([BeerItem]?) -> Void) {
        let params = Params.params
        networking.request(path: API.beerlist, params: params) { data, error in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: [BeerItem].self, from: data)
            response(decoded)
        }
    }
    
    func getNextBatch(response: @escaping ([BeerItem]?) -> Void) {
        
        if NetworkDataFetcher.currentUrlPage == 1 {
            NetworkDataFetcher.currentUrlPage = 2
        }
        
        let params = [API.page: "\(NetworkDataFetcher.currentUrlPage)", API.perPage: API.quantityPerPage]
        
        networking.request(path: API.beerlist, params: params) { data, error in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: [BeerItem].self, from: data)
            response(decoded)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
