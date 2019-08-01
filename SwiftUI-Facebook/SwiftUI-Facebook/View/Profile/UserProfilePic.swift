//
//  UserProfilePic.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct UserProfilePic: View {
    var body: some View {
        Image("spider")
           .resizable()
           .aspectRatio(contentMode: .fill)
           .clipShape(Circle())
           .shadow(radius: 10)
           .frame(width: 140, height: 140)
           .overlay(Circle().stroke(Color.white, lineWidth: 5)).foregroundColor(.white)
    }
}

#if DEBUG
struct UserProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilePic()
    }
}
#endif
