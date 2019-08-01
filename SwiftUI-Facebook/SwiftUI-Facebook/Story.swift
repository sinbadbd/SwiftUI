//
//  Mdoel.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import Foundation
import SwiftUI

struct Story : Hashable ,Identifiable {
  
    var id = UUID()
    let imageName : String
    let user: User
}

struct User : Hashable{
    let imageName : String
    let username : String
}

struct HomePageModel {
    var stories: [Story] = {
        var user = User(imageName: "1", username: "spider")
        return[
            Story(imageName: "1", user:user ),
            Story(imageName: "2", user:user ),
            Story(imageName: "3", user:user ),
            Story(imageName: "4", user:user ),
            Story(imageName: "5", user:user ),
            Story(imageName: "6", user:user )
        ]
    }()
}
