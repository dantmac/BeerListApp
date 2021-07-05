//
//  BeerlistDetailsPresenter.swift
//  BeerListApp
//
//  Created by admin on 26.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeerlistDetailsPresentationLogic {
    func presentData(response: BeerlistDetails.Model.Response.ResponseType)
}

class BeerlistDetailsPresenter: BeerlistDetailsPresentationLogic {
    weak var viewController: BeerlistDetailsDisplayLogic?
    
    func presentData(response: BeerlistDetails.Model.Response.ResponseType) {
        switch response {
        case .presentBeerDetails(let beerDetails):
            viewController?.displayData(viewModel: .displayBeerDetails(beerDetails: beerDetails))
        }
    }
}
