//
//  MainTabBarViewController.swift
//  BooksDataUIKit
//
//  Created by Sebastian Hajduk on 12/07/2022.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundPink
        
        let homeController = UINavigationController(rootViewController: HomeController())
        let favoritesController = UINavigationController(rootViewController: FavoritesController())
        let profileController = UINavigationController(rootViewController: ProfileController())
        
        homeController.tabBarItem.image = UIImage(systemName: "house")
        favoritesController.tabBarItem.image = UIImage(systemName: "heart")
        profileController.tabBarItem.image = UIImage(systemName: "person")
        
        homeController.title = "Home"
        favoritesController.title = "Favorites"
        profileController.title = "Profile"
        
        
        
        tabBar.tintColor = .label
        
        setViewControllers([homeController, favoritesController, profileController], animated: true)
        
    }
    
    
}
