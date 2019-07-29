//
//  UnsplashStore.swift
//  SwiftUI-JsonParsing
//
//  Created by Zahedul Alam on 29/7/19.
//  Copyright © 2019 devsloop. All rights reserved.
//

import Foundation

class UnsplashStore {
    static let url = URL(string: "https://api.unsplash.com/photos?client_id=4048043cf51ed551a7439644446f81915f579b1b1c3bd58d780eb4f300bc7604")!
 
    var model = [Model]()
    
    func fetch(){
        URLSession.shared.dataTask(with: UnsplashStore.url) { (data, response, error) in
             
            guard let data = data, error == nil else {
                return
            }
            
            guard let model = try? Unsplash(data: data) else {
                return
            }
            
            
            let VMModel = model.map{$0.user}.compactMap(Model.init)
            DispatchQueue.main.async {
                self.model = VMModel
            }
            
        }
    }
}
