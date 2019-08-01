//
//  ContentView.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                StoriesView(stories: HomePageModel().stories).frame( height: 230)
                Spacer()
            }
            .navigationBarTitle("Facebook")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
