//
//  ViewController.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 11/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    func setUpTabBar() {
        let videoController = UINavigationController(rootViewController: MoviesViewController())
        videoController.tabBarItem.image = UIImage(systemName: "play.circle.fill" )
        
        let favoriteController = UINavigationController(rootViewController: FavoritesViewController())
        favoriteController.tabBarItem.image = UIImage(systemName: "star.fill")
        
        viewControllers = [videoController, favoriteController]
    }


}

