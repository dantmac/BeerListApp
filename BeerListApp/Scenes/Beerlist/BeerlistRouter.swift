//
//  BeerlistRouter.swift
//  BeerListApp
//
//  Created by admin on 24.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeerlistRoutingLogic {
    func navigateToDetails(for cellViewModel: BeerCellViewModel)
}

class BeerlistRouter: NSObject, BeerlistRoutingLogic {
    
    weak var viewController: BeerlistViewController?
    
    // MARK: Routing
    
    func navigateToDetails(for cellViewModel: BeerCellViewModel) {
        let detailVC = BeerlistDetailsViewController(beerCellViewModel: cellViewModel)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
