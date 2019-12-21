//
//  MoviesBowserController.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 19/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class MoviesBowserController: UIViewController {
    
    var index = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Movie \(index)"
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
