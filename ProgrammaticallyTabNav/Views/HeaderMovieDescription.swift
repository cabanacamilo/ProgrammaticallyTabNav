//
//  HeaderMovieDescription.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 22/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class HeaderMovieDescription: UITableViewHeaderFooterView {
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let labelMovie: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let playButtom: UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Play", for: .normal)
        buttom.backgroundColor = .red
        buttom.tintColor = .white
        buttom.translatesAutoresizingMaskIntoConstraints = false
        return buttom
    }()
    
    let descriptionMovie: UILabel = {
        let label = UILabel()
        label.numberOfLines = 8
        label.font = .systemFont(ofSize: 15)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let directorMovie: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    func setLayout() {
        addSubview(headerView)
        headerView.addSubview(imageMovie)
        headerView.addSubview(labelMovie)
        headerView.addSubview(playButtom)
        headerView.addSubview(descriptionMovie)
        headerView.addSubview(directorMovie)
        headerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        headerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageMovie.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10).isActive = true
        imageMovie.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        imageMovie.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageMovie.heightAnchor.constraint(equalToConstant: 200 * 1.48).isActive = true
        labelMovie.topAnchor.constraint(equalTo: imageMovie.bottomAnchor, constant: 10).isActive = true
        labelMovie.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        playButtom.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        playButtom.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10).isActive = true
        playButtom.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        playButtom.topAnchor.constraint(equalTo: labelMovie.bottomAnchor, constant: 20).isActive = true
        descriptionMovie.topAnchor.constraint(equalTo: playButtom.bottomAnchor, constant: 10).isActive = true
        descriptionMovie.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        descriptionMovie.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10).isActive = true
        directorMovie.topAnchor.constraint(equalTo: descriptionMovie.bottomAnchor, constant: 10).isActive = true
        directorMovie.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        directorMovie.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
