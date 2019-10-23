//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by sinbad on 10/23/19.
//  Copyright © 2019 Imran. All rights reserved.
//

import Foundation

let imageURL = "https://image.tmdb.org/t/p/w500/"
let apiUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=de05a59a85ef1e7797de8d4a6d343d0e"
class MovieViewModel : ObservableObject {
    @Published var movie = [Result]()
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
                        let response = try JSONDecoder().decode(Movie.self, from: data)
                        DispatchQueue.main.async {
                            self.movie = response.results
                            print(self.movie)
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
