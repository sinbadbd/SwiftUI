//
//  NetworkManager.swift
//  SwiftUI-Essentials
//
//  Created by Zahedul Alam on 30/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

//https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC&tsyms=USD,EUR?api_key=6dde5c8daa2754efbbe226036c6cd30becdb3659631471b8cdf5734d1bb564a0
import SwiftUI
import Combine

class NetworkManager: BindableObject {
    static let API_KEY = "?api_key=6dde5c8daa2754efbbe226036c6cd30becdb3659631471b8cdf5734d1bb564a0"
   // static let BASE_URL = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC&tsyms=USD,EUR\(API_KEY)"
    
static let BASE_URL = "https://api.themoviedb.org/3/movie/now_playing?api_key=de05a59a85ef1e7797de8d4a6d343d0e"
    
    var willChange = PassthroughSubject<NetworkManager, Never>()
    
    var isDataFetch = false {
        willSet {
            willChange.send(self)
        }
    }
    
    var fetchCoindModel = [CoinsModel]()  {
        didSet {
            willChange.send(self)
        }
    }
    init() {
 
        guard let url = URL(string: NetworkManager.BASE_URL) else {return}
      //  print(url)
        var urlRequest  = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            print(urlRequest)
            guard let data = data,  error == nil else {
                 print(error?.localizedDescription as Any)
                return
            }
            let decode = JSONDecoder()
            
            let requestData = try! decode.decode(CoinsModel.self, from: data)
           // print("data-response: \(requestData)")
            DispatchQueue.main.async {
                self.fetchCoindModel = [requestData]
                //print("data:  \(test)")
                self.isDataFetch = true
            }
        }.resume()
    }
}
