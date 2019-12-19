//
//  MovieViewController.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 11/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: MovieDelegate!
    
    lazy var menuBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Menu", style: UIBarButtonItem.Style.plain, target: self, action: #selector(menuButton))
        return button
    }()
    
    let moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setLayout()
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.register(CellMovies.self, forCellWithReuseIdentifier: "Cell")
        moviesCollectionView.register(HeaderMovies.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
    }
    
    func setNavigationBar() {
        navigationItem.title = "Movies"
        navigationItem.rightBarButtonItem = menuBarButton
    }
    
    func setLayout() {
        view.addSubview(moviesCollectionView)
        let guide = view.safeAreaLayoutGuide
        moviesCollectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 5).isActive = true
        moviesCollectionView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        moviesCollectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -5).isActive = true
        moviesCollectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -5).isActive = true
    }
    
    @objc func menuButton(_ sender: UIBarButtonItem) {
        navigationController?.pushViewController(MenuViewController(), animated: true)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! HeaderMovies
        header.titleLabel.text = "Title \(indexPath.section)"
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 15) / 2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CellMovies
        cell.cellLabel.text = "section: \(indexPath.section)\n\nrow: \(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.selectedMovie(movie: indexPath)
        navigationController?.pushViewController(MoviesBowserController(), animated: true)
    }

}

protocol MovieDelegate {
    func selectedMovie(movie: IndexPath)
}
