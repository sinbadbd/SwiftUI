//
//  ContentView.swift
//  MovieDB
//
//  Created by Imran on 22/10/19.
//  Copyright © 2019 Imran. All rights reserved.
//
//https://api.themoviedb.org/3/movie/top_rated?api_key=de05a59a85ef1e7797de8d4a6d343d0e&language=en-US&page=1

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    //  let movie : Movie
    
    var body: some View {
        
        NavigationView {
            List {
                NavigationLink(destination: MovieDetailsView()) {
                    NowPlaying()
                } 
            }
            .navigationBarTitle("Now Playing")
        }
    }
}

