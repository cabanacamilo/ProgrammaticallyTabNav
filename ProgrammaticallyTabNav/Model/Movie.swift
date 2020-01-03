//
//  Movie.swift
//  ProgrammaticallyTabNav
//
//  Created by Camilo Cabana on 21/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import Foundation

struct AllMovies {
    var genderName: String
    var movies: [Movie]
}

struct Movie {
    var gender: String
    var name: String
    var description: String
    var photo: String
    var releaseDate: Date
    var director: String
    var isFavorite: Bool
}

class MoviesList: NSObject {
    
    var allMovies: [AllMovies] = {
        
        var fantasy: [Movie] = {
            var StarWarsTheRiseofSkywalker = Movie(gender: "Fantasy", name: "Star Wars: The Rise of Skywalker", description: "The surviving Resistance faces the First Order once more as Rey, Finn and Poe Dameron's journey continues. With the power and knowledge of generations behind them, the final battle commences.", photo: "StarWarsTheRiseofSkywalker", releaseDate: "December 19, 2019".asDate, director: "J.J. Abrams", isFavorite: false)
            var frozenTwo = Movie(gender: "Fantasy", name: "Frozen 2", description: "Elsa the Snow Queen has an extraordinary gift -- the power to create ice and snow. But no matter how happy she is to be surrounded by the people of Arendelle, Elsa finds herself strangely unsettled. After hearing a mysterious voice call out to her, Elsa travels to the enchanted forests and dark seas beyond her kingdom -- an adventure that soon turns into a journey of self-discovery.", photo: "frozenTwo", releaseDate: "November 21, 2019".asDate, director: "Jennifer Lee, Chris Buck", isFavorite: false)
            return [StarWarsTheRiseofSkywalker, frozenTwo]
        }()
        
        var drama: [Movie] = {
            var TwentyOneBridges = Movie(gender: "Drama", name: "21 Bridges", description: "After uncovering a massive conspiracy, an embattled NYPD detective joins a citywide manhunt for two young cop killers. As the night unfolds, he soon becomes unsure of who to pursue -- and who's in pursuit of him. When the search intensifies, authorities decide to take extreme measures by closing all of Manhattan's 21 bridges to prevent the suspects from escaping.", photo: "TwentyOneBridges", releaseDate: "December 5, 2019".asDate, director: "Brian Kirk", isFavorite: false)
            return [TwentyOneBridges]
        }()
        
        return [AllMovies(genderName: "Fantasy", movies: fantasy), AllMovies(genderName: "Drama", movies: drama)]
    }()
    
}

extension String {
    var asDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter.date(from: self) ?? Date()
    }
}
