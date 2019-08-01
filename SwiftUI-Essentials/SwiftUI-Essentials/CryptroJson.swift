//
//  CryptroJson.swift
//  SwiftUI-Essentials
//
//  Created by Zahedul Alam on 30/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

//https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC&tsyms=USD,EUR?api_key=6dde5c8daa2754efbbe226036c6cd30becdb3659631471b8cdf5734d1bb564a0

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
    
    @State var manage = NetworkManager()
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
//                Button(action: {
//                    self.manage.getCoins()
//                }) {
//                    Text("get all coins")
//                }
                if manage.isDataFetch {
                     
                    List{
                         Text(self.manage.fetchCoindModel[0].results[0].originalTitle)

//                        HStack {
//                            //Text("\(coins.name) (\(coins.id))")
//                         //   Spacer()
//                          //  Text(self.manage.fetchCoindModel[0].display.btc.usd.change24Hour)
//                              //                      .font(.largeTitle)
//                       //   Text(self.manage.fetchCoindModel[0].display.btc.usd.price)
//                            Text(self.manage.fetchCoindModel[0].results[0].title)
//                        }
                    }
                    
                } else {
                    Text("Loading...").font(.largeTitle)
                }
            }
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
