//
//  ContentView.swift
//  SwiftUI-JsonParsing
//
//  Created by Zahedul Alam on 29/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group{
            NavigationView{
                List (0..<10){ item in
                    ListRow(model: <#Model#>)
                }
            }
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
