//
//  StoriesView.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct StoriesView: View {
    var stories:  [Story]
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 10){
                ForEach(stories){ story in
                    CardView(story: story)
                }
            }
        }.padding([.leading, .trailing], 8)
    }
}

#if DEBUG
struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView(stories: HomePageModel().stories)
    }
}
#endif
