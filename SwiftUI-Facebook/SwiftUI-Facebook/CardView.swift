//
//  CardView.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var story : Story
    var body: some View {
        ZStack{
            BackgroundView(imageName: story.imageName)
            HStack{
                VStack(alignment: .leading){
                    ProfileView(prileImage: story.user.imageName)
                    Spacer()
                    Text(story.user.username)
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        
                }.padding()
                Spacer()
            }.frame(width: 130)
        }
        .frame(width: 130, height: 200)
        .clipped()
        .cornerRadius(10)
    }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(story: HomePageModel().stories[0])
    }
}
#endif
