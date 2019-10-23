//
//  MovieDetailsView.swift
//  MovieDB
//
//  Created by sinbad on 10/23/19.
//  Copyright © 2019 Imran. All rights reserved.
//

import SwiftUI

struct MovieDetailsView: View {
     
      //  let movie : Movie
        
        @State private var isTapped = false
        @State private var dragPosition = CGSize.zero
        
        var body: some View {
            ScrollView{
                VStack{
                    Image("movie.image")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                        .offset(x: 0, y: -100)
                    
                   // ZStack{
    //                    Image("play3")
    //                       .resizable()
    //                       .scaledToFill()
    //                       .frame(width:40,height: 40)
    //                       .aspectRatio(contentMode: .fill)
    //                       .clipped().offset(x: 0, y: -150)
                        
                           
                    //}
                    
                    Text("movie.name")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .lineLimit(4)
                        .foregroundColor(.white)
                        .offset(x: 75, y: -180)
                        .frame(width: 240, height: 50, alignment: .leading)
                        .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    
                    
                    Image("movie.image")
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
                        Text("dfs")
                            .font(.system(size: 16))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.primary)
                            //.background(Color.red)
                            .lineLimit(Int.max)
                            .offset(x: 0, y: -270)
                            .frame( height: 150, alignment: .top)
                            .padding(.init(top: 50, leading: 20, bottom: 10, trailing: 10))
                    }
                    //.frame( height: 150, alignment: .topLeading).background(Color.green)
                    
//                    MovieCast()
//                        .padding()
//                        .offset(x: 0, y: -260)
                        //.frame( height: 200).background(Color.red)
                }
            }
        }
}

//struct MovieDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsView()
//    }
//}
