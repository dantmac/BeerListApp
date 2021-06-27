//
//  BeerlistCodeCell.swift
//  BeerListApp
//
//  Created by admin on 25.06.2021.
//

import Foundation
import UIKit

protocol BeerCellViewModel {
    var name: String { get }
    var imageUrl: String { get }
    var description: String { get }
}

final class BeerlistCodeCell: UITableViewCell {
    
    static let reuseId = "BeerlistCell"
    
    // First Layer
    let cardView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0.85
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    // Second Layer
    let nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "DINCondensed-Bold", size: 30)
        label.textColor = .black
        return label
    }()
    
    let beerImageView: BeerImageView = {
       let image = BeerImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayers()
    }
  
    override func prepareForReuse() {
        beerImageView.set(imageURL: nil)
    }
    
    func setLayers() {
        backgroundColor = .clear
        
        overlayFirstLayer()
        overlaySecondLayer()
    }
    
    func set(viewModel: BeerCellViewModel) {
        nameLabel.text = viewModel.name
        beerImageView.set(imageURL: viewModel.imageUrl)
    }

    
    func overlaySecondLayer() {
        cardView.addSubview(nameLabel)
        cardView.addSubview(beerImageView)
        
        // beerImageView
        beerImageView.widthAnchor.constraint(equalToConstant: CellConstants.beerImageViewWidth).isActive = true
        beerImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8).isActive = true
        beerImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        beerImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8).isActive = true
        
        // nameLabel constraints
        nameLabel.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8).isActive = true
    }
    
    func overlayFirstLayer() {
        contentView.addSubview(cardView)
        
        cardView.fillSuperview(padding: CellConstants.cardViewInsets)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
