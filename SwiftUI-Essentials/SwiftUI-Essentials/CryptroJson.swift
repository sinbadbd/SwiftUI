//
//  CryptroJson.swift
//  SwiftUI-Essentials
//
//  Created by Zahedul Alam on 30/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import SwiftUI

struct Coins {
    let id : String
    let name : String
    let currency : String
}

struct CryptroJson: View {
    
    var coin : [Coins] = [
        Coins(id: "BDT", name: "BD", currency:"2000"),
        Coins(id: "USD", name: "USA", currency:"99"),
        Coins(id: "PAL", name: "IUO", currency:"23"),
        Coins(id: "HSK", name: "ASH", currency:"21231000"),
        Coins(id: "HOK", name: "BSH", currency:"2200")
    ]
    
    
    var body: some View {

        NavigationView{

            List(coin, id: \.self.id) {coins in
                
                HStack {
                    Text("\(coins.name) (\(coins.id))")
                    Spacer()
                    Text(coins.currency)
                }
            }.navigationBarTitle("Cryptro")
        }
    }
}

#if DEBUG
struct CryptroJson_Previews: PreviewProvider {
    static var previews: some View {
        CryptroJson()
    }
}
#endif
