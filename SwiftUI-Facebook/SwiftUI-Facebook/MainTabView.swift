//
//  MainTabView.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabbedView{
            HomePageView()
            .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Home")
             }.tag(0)
            
            UserProfileView()
            .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Profile")
            }.tag(1)
            
            FriendListView()
            .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Friend List")
            }.tag(2)
            
            NotificationVIew()
            .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Notifications")
            }.tag(3)
             
        }
    }
}

#if DEBUG
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
#endif
