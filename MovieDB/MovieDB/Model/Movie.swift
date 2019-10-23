//
//  Movie.swift
//  MovieDB
//
//  Created by sinbad on 10/23/19.
//  Copyright © 2019 Imran. All rights reserved.
//

import Foundation

struct Movie : Decodable {
    var results : [Result]
}
struct Result : Identifiable , Decodable {
    var id : Int
    var original_title : String
    var overview : String
    var poster_path : String
    var vote_average : Double
}
