//
//  BeerlistDetailsModels.swift
//  BeerListApp
//
//  Created by admin on 26.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum BeerlistDetails {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getBeerDetails(beerDetails: BeerCellViewModel)
      }
    }
    struct Response {
      enum ResponseType {
        case presentBeerDetails(beerDetails: BeerCellViewModel)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayBeerDetails(beerDetails: BeerCellViewModel)
      }
    }
  }
}
