//
//  ImageView.swift
//  SwiftUI-Essentials
//
//  Created by Zahedul Alam on 30/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("spider")
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .shadow(radius: 10)
    }
}

#if DEBUG
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
#endif
