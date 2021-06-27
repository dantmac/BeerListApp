//
//  BeerlistWorker.swift
//  BeerListApp
//
//  Created by admin on 24.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class BeerlistService {
    
    var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    var footerView = FooterView()
    
    private var beerItems: [BeerItem]?
    
    func getData(completion: @escaping ([BeerItem]) -> Void) {
        fetcher.getData { [weak self] beers in
            if ((self?.beerItems = beers) != nil) {
                guard let beerItems = self?.beerItems else { return }
                completion(beerItems)
            }
        }
    }
    
    func getNextBatch(completion: @escaping ([BeerItem]) -> Void) {
        fetcher.getNextBatch { [weak self] beers in
            guard let beers = beers else { return }
            
            var oldBeers = self?.beerItems
            let newBeers = beers
            let newBeersFiltered = newBeers.filter { newBeer in
                !oldBeers!.contains(where: { $0.id == newBeer.id })
            }
            
            oldBeers?.append(contentsOf: newBeersFiltered)
            self?.beerItems = oldBeers
            NetworkDataFetcher.currentUrlPage += 1
            
            guard let beerItems = self?.beerItems else { return }
            completion(beerItems)
        }
    }
}
