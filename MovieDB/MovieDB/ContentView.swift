//
//  ContentView.swift
//  MovieDB
//
//  Created by Imran on 22/10/19.
//  Copyright © 2019 Imran. All rights reserved.
//
//https://api.themoviedb.org/3/movie/top_rated?api_key=de05a59a85ef1e7797de8d4a6d343d0e&language=en-US&page=1

import SwiftUI

struct ContentView: View {
    @ObservedObject var obj = MovieViewModel()
    
   
    
    var body: some View {
        List(obj.movie) { i in
          //  Text()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//class observer : ObservableObject {
//    @Published var data = [datatype2]()
//
//
//    let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=de05a59a85ef1e7797de8d4a6d343d0e&language=en-US&page=1"
//
//    URLSession.
//}
let apiUrl = "http://api.themoviedb.org/3/movie/now_playing?api_key=de05a59a85ef1e7797de8d4a6d343d0e"
class MovieViewModel : ObservableObject {
    @Published var movie = [datatype2]()
    func fetchMovie(){
        guard let url = URL(string: apiUrl) else {return}
               
               URLSession.shared.dataTask(with: url) { (data, response, error) in
                   if let error = error {
                       print(error.localizedDescription)
                       return
                   }
                   
                   guard let response = response as? HTTPURLResponse else {return}
                   if response.statusCode == 200 {
                       guard let data = data else {return}
                       DispatchQueue.main.async {
                           do {
                            let response = try JSONDecoder().decode(datatype.self, from: data)
                            DispatchQueue.main.async {
                                self.movie = response.results
                            }
                               
                           } catch let error{
                               print("Error\(error)")
                           }
                       }
                       
                   } else {
                       print("HTTPURLResponse Error \(response.statusCode)")
                   }
                   
               }.resume()
    }
}



struct datatype : Decodable {
    var results : [datatype2]
}
struct datatype2 : Identifiable , Decodable {
    var id : Int
    var original_title : String
    var overview : String
    var poster_path : String
    var vote_average : String
}
