//
//  ImageRow.swift
//  SwiftUI-JsonParsing
//
//  Created by Zahedul Alam on 29/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct ImageRow: View {
    let model : Model
    var body: some View {
        HStack{
            Image(uiImage: model.image)
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 5)
            VStack(alignment: .leading){
                Text(model.name)
                Text(model.bio).font(.subheadline)
            }
        }
    }
}

//#if DEBUG
//struct ImageRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageRow()
//    }
//}
//#endif
