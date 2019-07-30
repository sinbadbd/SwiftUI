//
//  TextFieldView.swift
//  SwiftUI-Essentials
//
//  Created by Zahedul Alam on 30/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct TextFieldView: View {

    @Binding var textBinding: String
    let pleaceHolder : String
    var body: some View {
        VStack{
            TextField(pleaceHolder, text: $textBinding)
                       .border(Color.gray)
                       .textFieldStyle(.roundedBorder)
                       .padding(.leading, 10)
                       .padding(.trailing, 10)
            
            Button(action: {
                print(self.textBinding)
                self.textBinding = "Something"
            }) {
                Text("Get value")
            }
        }
    }
}

//#if DEBUG
//struct TextFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldView(textBinding: self.init(), pleaceHolder: "")
//    }
//}
//#endif
