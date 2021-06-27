//
//  BeerResponse.swift
//  BeerListApp
//
//  Created by admin on 24.06.2021.
//

import Foundation

struct BeerItem: Decodable {
    let id: Int
    let name: String
    let imageUrl: String
    let description: String
}
