//
//  BackgroundView.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    var imageName: String
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    LinearGradient(gradient: Gradient(colors:[ Color.gray.opacity(0), Color.black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                    .cornerRadius(10)
                )
        }
    }
}

#if DEBUG
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(imageName: "1")
    }
}
#endif
