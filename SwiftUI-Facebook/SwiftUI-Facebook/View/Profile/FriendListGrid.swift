//
//  FriendListGrid.swift
//  SwiftUI-Facebook
//
//  Created by Zahedul Alam on 6/8/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct FriendListGrid: View {
    var body: some View {
     
        FlexGridView(columns: 3, numItems: 6, alignment: .leading) { index, colWidth in
          VStack {
           Image("spider").resizable().scaledToFit()
              .padding(6)
              .frame(width: colWidth, height: colWidth)
              .tapAction { print("Meow!") }
            Text(" \(index) ")
          }
          .padding()
          .frame(width: colWidth)
          //.border(Color.gray)
          .background(Color.white)
          .tapAction {
            print("Tap!")
          }
        }
    }
}

#if DEBUG
struct FriendListGrid_Previews: PreviewProvider {
    static var previews: some View {
        FriendListGrid()
    }
}
#endif
