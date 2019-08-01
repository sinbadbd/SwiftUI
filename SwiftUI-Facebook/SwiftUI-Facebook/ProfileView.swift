//
//  ProfileView.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    var prileImage : String
    
    var body: some View {
        Image(prileImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .shadow(radius: 5)
            .frame(width: 50, height: 50)
            
            .overlay(Circle().stroke(Color.blue, lineWidth: 5))
    }
}

#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(prileImage: "spider")
    }
}
#endif
