//
//  API.swift
//  BeerListApp
//
//  Created by admin on 25.06.2021.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.punkapi.com"
    static let beerlist = "/v2/beers"
    static let page = "page"
    static let perPage = "per_page"
    static let quantity = "1"
    static let quantityPerPage = "25"

}

enum Params {
    static var params = [API.page: API.quantity, API.perPage: API.quantityPerPage]
}
