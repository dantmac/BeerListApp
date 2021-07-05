//
//  FooterView.swift
//  BeerListApp
//
//  Created by admin on 26.06.2021.
//

import Foundation
import  UIKit

class FooterView: UIView {
    
    private var footerLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = "Loading..."
        label.font = UIFont(name: "Arial", size: 15)
        label.textColor = .white
        label.alpha = 0.85
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true
        loader.color = .white
        return loader
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(footerLabel)
        addSubview(loader)
        
        footerLabel.anchor(top: topAnchor,
                           leading: leadingAnchor,
                           bottom: nil,
                           trailing: trailingAnchor,
                           padding: UIEdgeInsets(top: 8, left: 30, bottom: 000, right: 30))
        
        loader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loader.topAnchor.constraint(equalTo: footerLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    func showLoader() {
        loader.startAnimating()
        footerLabel.isHidden = false
    }
    
    func hideLoader() {
        loader.stopAnimating()
        footerLabel.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
