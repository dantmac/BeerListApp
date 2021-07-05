//
//  BeerlistDetailsViewController.swift
//  BeerListApp
//
//  Created by admin on 26.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeerlistDetailsDisplayLogic: AnyObject {
    func displayData(viewModel: BeerlistDetails.Model.ViewModel.ViewModelData)
}

class BeerlistDetailsViewController: UIViewController, BeerlistDetailsDisplayLogic {
    
    var interactor: BeerlistDetailsBusinessLogic?
    
    private var beerCellViewModel: BeerCellViewModel?
    
    private var detailView = DetailView()
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = BeerlistDetailsInteractor()
        let presenter             = BeerlistDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter      = presenter
        presenter.viewController  = viewController
    }
  
    // MARK: View lifecycle
    
    convenience init(beerCellViewModel: BeerCellViewModel) {
        self.init()
        self.beerCellViewModel = beerCellViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = detailView
      
        setup()
        
        interactor?.makeRequest(request: .getBeerDetails(beerDetails: beerCellViewModel!))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func displayData(viewModel: BeerlistDetails.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayBeerDetails(let beerDetails):
            detailView.set(viewModel: beerDetails)
        }
    }
}
