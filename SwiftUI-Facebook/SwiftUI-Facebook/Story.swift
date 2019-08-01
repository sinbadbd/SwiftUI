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

struct Feed :Hashable, Identifiable {
    var id = UUID()
    let imagename : String
    let text : String
    let user : User
}

struct HomePageModel {
    var stories: [Story] = {
        var user = User(imageName: "1", username: "spider")
        var user2 = User(imageName: "spider", username: "Sinbad")
        return[
            Story(imageName: "1", user:user ),
            Story(imageName: "2", user:user2 ),
            Story(imageName: "3", user:user ),
            Story(imageName: "4", user:user ),
            Story(imageName: "5", user:user ),
            Story(imageName: "6", user:user )
        ]
    }()
    
    var feeds: [Feed] = {
        var user2 = User(imageName: "spider", username: "Sinbad")

        return [
            Feed(imagename: "6", text: "Beautiful bird!!!", user: user2),
            Feed(imagename: "3", text: "Some birds are not meant to be caged, that's all. Their feathers are too bright, their songs too sweet and wild. So you let them go, or when you open the cage to feed them they somehow fly out past you.", user: user2),
            Feed(imagename: "1", text: "The reason birds can fly and we can't is simply because they have perfect faith, for to have faith is to have wings.", user: user2),
            Feed(imagename: "5", text: "The early bird gets the worm, but the second mouse gets the cheese.", user: user2),
            Feed(imagename: "2", text: "She decided to free herself, dance into the wind, create a new language. And birds fluttered around her, writing “yes” in the sky.", user: user2)
        ]
    }()
    
    
}


 
