//
//  ContentView.swift
//  SwiftUI-Essentials
//
//  Created by Zahedul Alam on 30/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
    @State private var commentTextField : String = ""

    @State private var showAlert = false
    @State private var showModal = false
    
    var body: some View {
        VStack{
            ImageView()
            TextView()
            TextFieldView(textBinding: $commentTextField, pleaceHolder: "text....")
            
            // BINDING
            Button(action: {
                print("Button")
                self.commentTextField = "get something"
            }) {
                Text("I'm a button")
            }
            // ALERT
            Button(action: {
                self.showAlert = true
            }) {
               Text("Show Alert Button")
            }.alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Title"), message: Text("This is sweet alert message"))
            }
            
            // MODAL
            Button(action: {
                self.showModal = true
            }) {
                Text("This is Modal")
            }.sheet(isPresented: $showModal, content: {
                Text("This is model")
                ImageView()
                TextView()
            })
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
