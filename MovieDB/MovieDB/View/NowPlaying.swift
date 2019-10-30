//
//  NowPlaying.swift
//  MovieDB
//
//  Created by sinbad on 10/23/19.
//  Copyright © 2019 Imran. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
struct NowPlaying: View {
    
    @ObservedObject var movieData = MovieViewModel()
    
    init() {
        self.movieData.fetchMovie()
    }
    var body: some View {
        NavigationView{
            VStack {
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(self.movieData.movie) { movie in
                        NavigationLink(destination: MovieDetailsView(movie: movie)){
                            HStack{
                                WebImage(url: URL(string: "\(imageURL)\(movie.poster_path)"))
                                    .onSuccess(perform: { (image, cacheType) in
                                        // Success
                                    })
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 140, height: 150)
                                VStack(alignment: .leading){
                                    Text("\(movie.original_title)")
                                        .bold()
                                    
                                    Text("\(movie.overview)")
                                        .lineLimit(2)
                                    
                                    CircleView(value: 0.4)
                                        .frame(width: 40, height: 40, alignment: .center)
                                    
                                    Text("\(movie.vote_average)")
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct NowPlaying_Previews: PreviewProvider {
//    static var previews: some View {
//        NowPlaying()
//    }
//}
