//
//  ContentView.swift
//  ChatMessage-SwiftUI
//
//  Created by sinbad on 10/20/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    var body: some View {
        NavigationView {
            ZStack{
                Color.orange
                VStack{
                    Image(systemName:"person.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.top, 12)
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                    NavigationLink(destination: MessagePage()) {
                        HStack{
                            Text("Join")
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding()
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MessagePage : View {
    var body : some View {
        Text("hi")
    }
}
