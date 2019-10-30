//
//  MovieDetailsView.swift
//  MovieDB
//
//  Created by sinbad on 10/23/19.
//  Copyright © 2019 Imran. All rights reserved.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movie : Movie
   
    var body: some View {
        ScrollView{
            VStack{
                Image(movie.results[0].poster_path)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    .offset(x: 0, y: -100)
 
                Text(movie.results[0].original_title)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .lineLimit(4)
                    .foregroundColor(.white)
                    .offset(x: 75, y: -180)
                    .frame(width: 240, height: 50, alignment: .leading)
                    .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                
                
                Image(movie.results[0].poster_path)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .cornerRadius(10)
                    .frame(width: 120, height: 180)
                    .shadow(radius: 10)
                    .padding(.leading, -180)
                    .background(Color.red)
                    .aspectRatio(CGSize(width:120, height: 180), contentMode: .fit)
                    .offset(x: 0, y: -240)
                    .onTapGesture {
                        print("hi")
                        
                }
                
                // MARK: NEED REFACTOR CODE: BUG
                VStack(alignment: .leading){
                    Text(movie.results[0].overview)
                        .font(.system(size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.primary)
                        //.background(Color.red)
                        .lineLimit(Int.max)
                        .offset(x: 0, y: -270)
                        .frame( height: 150, alignment: .top)
                        .padding(.init(top: 50, leading: 20, bottom: 10, trailing: 10))
                }
            }
        }
    }
}
