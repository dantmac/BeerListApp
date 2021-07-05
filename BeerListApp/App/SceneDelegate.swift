//
//  SceneDelegate.swift
//  BeerListApp
//
//  Created by admin on 24.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
       
        let beerlistVC = BeerlistViewController()
        let navigatonVC = UINavigationController(rootViewController: beerlistVC)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigatonVC
        window?.makeKeyAndVisible()
    }
}

