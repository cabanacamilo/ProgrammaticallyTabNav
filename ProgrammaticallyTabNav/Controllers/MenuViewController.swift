//
//  MenuViewController.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 11/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let menuView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.label.cgColor
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
        navigationItem.title = "Menu"
        setLayout()
        view.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        view.addSubview(menuView)
        let guide = view.safeAreaLayoutGuide
        menuView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 5).isActive = true
        menuView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 5).isActive = true
        menuView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -5).isActive = true
        menuView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -5).isActive = true
    }

}
