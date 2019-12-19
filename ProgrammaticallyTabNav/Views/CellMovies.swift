//
//  CellMovies.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 19/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class CellMovies: UICollectionViewCell {
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    func setLayout() {
        addSubview(cellLabel)
        layer.borderWidth = 0.5
        cellLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
