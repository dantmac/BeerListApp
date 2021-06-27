//
//  BeerlistModels.swift
//  BeerListApp
//
//  Created by admin on 24.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Beerlist {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getBeerlist
        case getNextBatch
      }
    }
    struct Response {
      enum ResponseType {
        case presentBeerlist(beer: [BeerItem])
        case presentFooterLoader
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayBeerlist(beerViewModel: BeerViewModel)
        case displayFooterLoader
      }
    }
  }
}

struct BeerViewModel {
    struct Cell: BeerCellViewModel {
        var name: String
        var imageUrl: String
        var description: String
    }
    
    let cells: [BeerCellViewModel]
}
