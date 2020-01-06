//
//  FavoritesViewController.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 11/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var favoriteMovies = [Movie]()
    
    let favoriteMoviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.backgroundColor = .systemBackground
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        return collectionVIew
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        favoriteMoviesCollectionView.dataSource = self
        favoriteMoviesCollectionView.delegate = self
        favoriteMoviesCollectionView.register(CellMovies.self, forCellWithReuseIdentifier: "FavoriteCell")
        navigationItem.title = "Favorites"
        
    }
    
    func setLayout() {
        view.addSubview(favoriteMoviesCollectionView)
        let guide = view.safeAreaLayoutGuide
        favoriteMoviesCollectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 5).isActive = true
        favoriteMoviesCollectionView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        favoriteMoviesCollectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -5).isActive = true
        favoriteMoviesCollectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -5).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 15) / 2
        return CGSize(width: width, height: width * 1.48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! CellMovies
        cell.movieImage.image = UIImage(named: favoriteMovies[indexPath.row].photo)
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar = tabBarController as! MainTabBarController
        favoriteMovies = tabBar.favoriteMovies
        print(favoriteMovies)
        favoriteMoviesCollectionView.reloadData()
    }

}
