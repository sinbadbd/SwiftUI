//
//  ContentView.swift
//  SwiftUI-JsonParsing
//
//  Created by Zahedul Alam on 29/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObjectBinding var store : UnsplashStore
    
    var body: some View {
        Group{
            if store.model.isEmpty {
                Loader()
            } else {
                NavigationView{
                    List (store.model, rowContent: ImageRow.init).navigationBarTitle("Image ")
                }
            }
        }.onAppear(perform: store.fetch)
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: UnsplashStore())
    }
}
#endif
