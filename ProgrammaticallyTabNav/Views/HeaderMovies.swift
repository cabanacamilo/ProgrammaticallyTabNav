//
//  HeaderMovies.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 11/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class HeaderMovies: UICollectionViewCell {
    
    let moviesView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.label.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    func setLayout() {
        addSubview(moviesView)
        moviesView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        moviesView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        moviesView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        moviesView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
