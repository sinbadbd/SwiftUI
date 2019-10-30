//
//  ContentView.swift
//  DesignCode
//
//  Created by sinbad on 10/23/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
     var body: some View {
           ZStack {
               
//               VStack {
//                   Text("Card Back")
//               }
//               .frame(width: 300, height: 220.0)
//               .background(Color.blue)
//               .cornerRadius(10)
//               .shadow(radius: 20)
//               .offset(x: 0, y: -20)

               VStack {
                   HStack {
                       VStack(alignment: .leading) {
                           Text("UI Design")
                               .font(.headline)
                               .fontWeight(.bold)
                               .foregroundColor(Color("accent"))
                               .padding(.top)
                               Text("Certificate")
                                   .foregroundColor(.white)
                           }
                           Spacer()
                           Image("Logo")
                               .resizable()
                               .frame(width: 30.0, height: 30.0)
                       }
                       .padding(.horizontal)
                       Spacer()
                       Image("Background")
                   }
                   .frame(width: 340.0, height: 220.0)
                   .background(Color.black)
                   .cornerRadius(10)
                   .shadow(radius: 20)
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
