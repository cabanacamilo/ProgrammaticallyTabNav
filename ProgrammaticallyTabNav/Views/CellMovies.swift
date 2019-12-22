//
//  CellMovies.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 19/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class CellMovies: UICollectionViewCell {
    
    let movieImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    func setLayout() {
        addSubview(movieImage)
        movieImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        movieImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
