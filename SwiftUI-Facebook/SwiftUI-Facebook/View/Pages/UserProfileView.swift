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
        
        NavigationView{
            VStack{
                CoverPicture()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped().cornerRadius(10)
                    .padding([.leading, .trailing], 15)
                
                UserProfilePic()
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                ZStack{
                    Button(action: {
                        
                    }) {
                       Image(systemName: "camera")
                    }.offset(x: 50, y: -50).foregroundColor(.black)
                }
                
                Spacer()
            }
            .navigationBarTitle("Profile")
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
