//
//  BeerlistViewController.swift
//  BeerListApp
//
//  Created by admin on 24.06.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeerlistDisplayLogic: AnyObject {
    func displayData(viewModel: Beerlist.Model.ViewModel.ViewModelData)
}

class BeerlistViewController: UIViewController, BeerlistDisplayLogic {
    
    var interactor: BeerlistBusinessLogic?
    var router: (NSObjectProtocol & BeerlistRoutingLogic)?
    
    private var beerViewModel = BeerViewModel(cells: [])
    private lazy var footerView = FooterView()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(BeerlistCodeCell.self, forCellReuseIdentifier: BeerlistCodeCell.reuseId)
        table.separatorStyle = .none
        table.backgroundColor = .clear
        return table
    }()
    
    private let backgroundImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "brewdog")
        return image
    }()
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = BeerlistInteractor()
        let presenter             = BeerlistPresenter()
        let router                = BeerlistRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupBackgroundImage()
        setTableView()
        setupTopBars()
        interactor?.makeRequest(request: .getBeerlist)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func displayData(viewModel: Beerlist.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayBeerlist(let beerViewModel):
            self.beerViewModel = beerViewModel
            footerView.hideLoader()
            tableView.reloadData()
        case .displayFooterLoader:
            footerView.showLoader()
            
        }
    }
    
   func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if scrollView.contentOffset.y > scrollView.contentSize.height * 0.85 {
            interactor?.makeRequest(request: .getNextBatch)
        }
    }
    
    private func setTableView() {
        super.view.addSubview(tableView)
        
        tableView.fillSuperview()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = footerView
        tableView.indicatorStyle = .white
    }
    
    private func setupTopBars() {
        
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        let topBar = UIView(frame: keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)

        topBar.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        topBar.layer.shadowColor = UIColor.black.cgColor
        topBar.layer.shadowOpacity = 0.3
        topBar.layer.shadowOffset = CGSize.zero
        topBar.layer.shadowRadius = 8
        view.addSubview(topBar)
        
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    private func setupBackgroundImage() {
        super.view.addSubview(backgroundImage)
        backgroundImage.fillSuperview()
    }
}

extension BeerlistViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerViewModel.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerlistCodeCell.reuseId, for: indexPath) as! BeerlistCodeCell
        let cellViewModel = beerViewModel.cells[indexPath.row]
        cell.selectionStyle = .none
        cell.set(viewModel: cellViewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = beerViewModel.cells[indexPath.row]
        router?.navigateToDetails(for: cellViewModel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellConstants.cellHeight
    }
}
