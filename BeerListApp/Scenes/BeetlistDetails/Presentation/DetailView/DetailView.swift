//
//  DetailView.swift
//  BeerListApp
//
//  Created by admin on 27.06.2021.
//

import Foundation
import UIKit

final class DetailView: UIView {
    
    // Background Layer
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "brewdog")
        return image
    }()
    
    // First Layer
    let detailScrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // Second Layer
    let detailContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.alpha = 0.85
        return view
    }()
    
    // Third Layer
    let beerImageView: BeerImageView = {
        var image = BeerImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "DINCondensed-Bold", size: 35)
        label.textColor = .black
        return label
    }()
    
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "DINAlternate-Bold", size: 20)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayers()
    }
    
    func setLayers() {
        overlayBackgroundLayer()
        overlayFirstLayer()
        overlaySecondLayer()
        overlayThirdLayer()
    }
    
    func set(viewModel: BeerCellViewModel) {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        beerImageView.set(imageURL: viewModel.imageUrl)
    }
    
    func overlayThirdLayer() {
        detailContentView.addSubview(beerImageView)
        detailContentView.addSubview(nameLabel)
        detailContentView.addSubview(descriptionLabel)
        
        // beerImageView constraints
        beerImageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        beerImageView.topAnchor.constraint(equalTo: detailContentView.topAnchor, constant: 40).isActive = true
        beerImageView.leadingAnchor.constraint(equalTo: detailContentView.leadingAnchor, constant: 40).isActive = true
        beerImageView.trailingAnchor.constraint(equalTo: detailContentView.trailingAnchor, constant: -40).isActive = true
        
        // nameLabelView constraints
        nameLabel.topAnchor.constraint(equalTo: beerImageView.bottomAnchor, constant: 50).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: detailContentView.leadingAnchor, constant: 50).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: detailContentView.trailingAnchor, constant: -50).isActive = true
        
        // descriptionLabel constraints
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: detailContentView.leadingAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: detailContentView.trailingAnchor, constant: -30).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: detailContentView.bottomAnchor, constant: -40).isActive = true
    }
    
    
    func overlaySecondLayer() {
        detailScrollView.addSubview(detailContentView)
        detailContentView.topAnchor.constraint(equalTo: detailScrollView.topAnchor, constant: 20).isActive = true
        detailContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        detailContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        detailContentView.bottomAnchor.constraint(equalTo: detailScrollView.bottomAnchor, constant: -100).isActive = true
    }
    
    func overlayFirstLayer() {
        addSubview(detailScrollView)
        
        detailScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        detailScrollView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 0).isActive = true
        detailScrollView.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: 0).isActive = true
        detailScrollView.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 0).isActive = true
    }
    
    func overlayBackgroundLayer() {
        addSubview(backgroundImage)
        backgroundImage.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
