//
//  TrailerController.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 26/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class TrailerController: UIViewController {
    
    var trailer = IndexPath()
    
    let playTrailer: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setLayout()
        playTrailer.text = "Running Trailer \(trailer.row + 1)"
    }
    
    func setLayout() {
        view.addSubview(playTrailer)
        view.backgroundColor = .systemBackground
        playTrailer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playTrailer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
