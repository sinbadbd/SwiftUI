//
//  ContentView.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct HomePageView: View {
    var model = HomePageModel()
    var body: some View {
        NavigationView{             
            List {
                StoriesView(stories: HomePageModel().stories).frame( height: 235).listRowInsets(EdgeInsets())
                Spacer()
                ForEach(model.feeds) { feed in
                    FeedView(feed: feed).frame( height: 440, alignment: .top).padding()
                }.listRowInsets(EdgeInsets())
            }.navigationBarTitle("Title")
        }
    }
}

#if DEBUG
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
#endif
