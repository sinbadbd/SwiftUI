//
//  Model.swift
//  SwiftUI-JsonParsing
//
//  Created by Zahedul Alam on 29/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct Model : Identifiable {
    let id : String
    let name : String
    let bio: String
    let image : UIImage
    
    init(user: User) {
        self.id = user.id
        self.name = user.name
        self.bio = user.bio ?? ""
        if let url = URL(string: user.profileImage.medium) {
            let data = try! Data(contentsOf: url)
            self.image = UIImage(data: data) ?? UIImage(imageLiteralResourceName: "")
        } else {
            self.image = UIImage(imageLiteralResourceName: "")
        }
    }
}
