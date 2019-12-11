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
        // Do any additional setup after loading the view.
        setUpTabBar()
    }
    
    func setUpTabBar() {
        let videoController = UINavigationController(rootViewController: MoviesViewController())
        videoController.tabBarItem.image = UIImage(systemName: "power" )
        
        let favoriteController = UINavigationController(rootViewController: FavoritesViewController())
        favoriteController.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [videoController, favoriteController]
    }


}

