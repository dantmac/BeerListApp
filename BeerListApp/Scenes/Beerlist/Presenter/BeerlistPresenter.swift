//
//  BeerlistPresenter.swift
//  BeerListApp
//
//  Created by admin on 24.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeerlistPresentationLogic {
    func presentData(response: Beerlist.Model.Response.ResponseType)
}

class BeerlistPresenter: BeerlistPresentationLogic {
    weak var viewController: BeerlistDisplayLogic?
    
    func presentData(response: Beerlist.Model.Response.ResponseType) {
        switch response {
        case .presentBeerlist(let beer):
            let cells = beer.map { beerItem in
                cellViewModel(from: beerItem)
            }
            
            let beerViewModel = BeerViewModel(cells: cells)
            viewController?.displayData(viewModel: .displayBeerlist(beerViewModel: beerViewModel))
            
        case .presentFooterLoader:
            viewController?.displayData(viewModel: .displayFooterLoader)
        }
    }
    
    private func cellViewModel(from beerItem: BeerItem) -> BeerViewModel.Cell {
        return BeerViewModel.Cell(name: beerItem.name,
                                  imageUrl: beerItem.imageUrl,
                                  description: beerItem.description)
    }
}
