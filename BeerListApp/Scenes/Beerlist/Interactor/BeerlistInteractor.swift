//
//  BeerlistInteractor.swift
//  BeerListApp
//
//  Created by admin on 24.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeerlistBusinessLogic {
    func makeRequest(request: Beerlist.Model.RequestType)
}

class BeerlistInteractor: BeerlistBusinessLogic {
    
    var presenter: BeerlistPresentationLogic?
    var service: BeerlistServiceProtocol = BeerlistService()
    
    func makeRequest(request: Beerlist.Model.RequestType) {
        switch request {
        case .getBeerlist:
            service.getBeerlist(completion: { [weak self] beerItems in
                self?.presenter?.presentData(response: .presentBeerlist(beer: beerItems))
            })
        case .getNextBatch:
            self.presenter?.presentData(response: .presentFooterLoader)
            service.getNextBatch(completion: { beers in
                self.presenter?.presentData(response: .presentBeerlist(beer: beers))
            })
        }
    }
}
