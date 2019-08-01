//
//  ProfileView.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {

        VStack{
            CoverPicture()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .padding([.leading, .trailing], 15)

            UserProfilePic()
                .offset(y: -130)
                .padding(.bottom, -130)
            Spacer()
        }
    }
}

#if DEBUG
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
#endif
