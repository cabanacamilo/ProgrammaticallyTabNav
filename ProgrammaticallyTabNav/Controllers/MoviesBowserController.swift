//
//  MoviesBowserController.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 19/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class MoviesBowserController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movieIndex = IndexPath()
    var mainController: MoviesViewController?
    
    let movieTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = mainController?.movies[movieIndex.section].movies[movieIndex.row].name
        setLayout()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TrailerCell")
        movieTableView.register(HeaderMovieDescription.self, forHeaderFooterViewReuseIdentifier: "MovieDescription")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    func setLayout() {
        view.addSubview(movieTableView)
        let guide = view.safeAreaLayoutGuide
        movieTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        movieTableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        movieTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        movieTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 600
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MovieDescription") as! HeaderMovieDescription
        header.imageMovie.image = UIImage(named: (mainController?.movies[movieIndex.section].movies[movieIndex.row].photo)!)
        header.descriptionMovie.text = mainController?.movies[movieIndex.section].movies[movieIndex.row].description
        header.labelMovie.text = "\((mainController?.movies[movieIndex.section].movies[movieIndex.row].gender)!) Movie; \((mainController?.movies[movieIndex.section].movies[movieIndex.row].releaseDate)!)"
        header.directorMovie.text = mainController?.movies[movieIndex.section].movies[movieIndex.row].director
        if (mainController?.movies[movieIndex.section].movies[movieIndex.row].isFavorite)! {
            header.favoriteButtom.backgroundColor = .yellow
            header.favoriteButtom.setTitleColor(.black, for: .normal)
        } else {
            header.favoriteButtom.backgroundColor = .gray
            header.favoriteButtom.setTitleColor(.white, for: .normal)
        }
        header.favoriteButtom.addTarget(self, action: #selector(isFavoriteButton), for: .touchUpInside)
        return header
    }
    
    @objc func isFavoriteButton() {
        if (mainController?.movies[movieIndex.section].movies[movieIndex.row].isFavorite)! {
            print("No")
            mainController?.movies[movieIndex.section].movies[movieIndex.row].isFavorite = false
        } else {
            print("yes")
            mainController?.movies[movieIndex.section].movies[movieIndex.row].isFavorite = true
            mainController?.addFavoriteMovie(movie: (mainController?.movies[movieIndex.section].movies[movieIndex.row])!)
        }
        movieTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrailerCell", for: indexPath)
        cell.textLabel?.text = "Trailer \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Run Trailer\(indexPath.row + 1)")
        let vc = TrailerController()
        vc.trailer = indexPath
        navigationController?.pushViewController(vc, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        movieTableView.reloadData()
    }
    
}
