//
//  BeerlistDetailsInteractor.swift
//  BeerListApp
//
//  Created by admin on 26.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeerlistDetailsBusinessLogic {
    func makeRequest(request: BeerlistDetails.Model.Request.RequestType)
}

class BeerlistDetailsInteractor: BeerlistDetailsBusinessLogic {
    
    var cellViewModel: BeerCellViewModel?
    
    var presenter: BeerlistDetailsPresentationLogic?
    
    func makeRequest(request: BeerlistDetails.Model.Request.RequestType) {
        switch request {
        case .getBeerDetails(let beerDetails):
            presenter?.presentData(response: .presentBeerDetails(beerDetails: beerDetails))
        }
    }
}

