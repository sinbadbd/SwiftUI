//
//  FeedView.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    
    @State var showModal = false
    var feed : Feed
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                ProfileView(prileImage: feed.imagename)
                
                VStack(alignment: .leading){
                    HStack{
                        Text(feed.user.username).font(.headline)
                        Text("Share a")
                        Text("Post").font(.headline)
                    }
                    Text("Publishd yesterday").font(.caption).foregroundColor(.gray)
                }
                Spacer()

                Button(action: {
                    self.showModal = true
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }.sheet(isPresented: $showModal, content: {
                    Text("This is model")
                    
                })
            }
            
            Text(feed.text)
               // .padding([.leading, .trailing], 10)
            Image(feed.imagename)
                .resizable()
                .scaledToFill()
                .cornerRadius(4)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .frame(height: 250, alignment: .center)
        }
    }
}

#if DEBUG
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(feed: HomePageModel().feeds[1])
    }
}
#endif
