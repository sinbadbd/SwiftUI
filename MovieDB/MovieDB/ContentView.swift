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
//    @ObservedObject var obj = MovieViewModel()
//    var movie : Movie
//    init() {
//        self.obj.fetchMovie()
//    }
    var body: some View {
        NavigationView {
            
            List {
                NowPlaying()
            }
        .navigationBarTitle("Now Playing")
            
//            ScrollView(.vertical, showsIndicators: false) {
//                VStack {
//                    ForEach(obj.) { movie in
//                        NavigationLink(destination: MovieDetailsView(details: movie)){
//                            HStack{
//                                WebImage(url: URL(string: "\(imageURL)\(movie.poster_path)"))
//                                    .onSuccess(perform: { (image, cacheType) in
//                                        // Success
//                                    })
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 140, height: 150)
//                                VStack(alignment: .leading){
//                                    Text("\(movie.original_title)")
//                                        .bold()
//
//                                    Text("\(movie.overview)")
//                                        .lineLimit(2)
//
//                                    CircleView(value: 0.4)
//                                        .frame(width: 40, height: 40, alignment: .center)
//
//                                    Text("\(movie.vote_average)")
//                                    Spacer()
//                                }
//                            }
//                        }
//                    }
//                }
//            }
        }
    }
}


