//
//  CoverPicture.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 1/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct CoverPicture: View {
    var body: some View {
        Image("coverphoto")
            .resizable()
            .scaledToFill()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}

#if DEBUG
struct CoverPicture_Previews: PreviewProvider {
    static var previews: some View {
        CoverPicture()
    }
}
#endif
