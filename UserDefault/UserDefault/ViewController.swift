//
//  ViewController.swift
//  UserDefault
//
//  Created by Imran on 4/2/20.
//  Copyright © 2020 Im. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    var dict = [
        "name" : "imran",
        "language" : "Bangladesh",
        "occupation" : "Developer",
        "age" : 10 
        ] as [String : Any]
    
    let interestingNumbers = [
        "Prime": [2, 3, 5, 7, 11, 13],
        "Fibonacci": [1, 1, 2, 3, 5, 8],
        "Square": [1, 4, 9, 16, 25]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaults    = UserDefaults.standard
        let name        = defaults.string(forKey: "name") ?? "Unknown user"
        let occupation  = defaults.string(forKey: "occupation") ?? "Unknown"
        let age         = defaults.integer(forKey: "age")
        
        // print(name, occupation, age)
        
        dict.forEach { dict in
            // print(dict.value[)
            // print(dict)
            let name = dict.value
            
            print(name)
            //          var test =   UserDefaults.standard.set(dict, forKey: "saveDic")
            //            print(test)
            //          let name = UserDefaults.standard.string(forKey: "name")
            //            print(name)
        }
        
        var largest = 0
        
        for (index, number) in interestingNumbers {
//            print(number)
            for num in number {
//                print(num)
                if num > largest {
                    largest = num
                    print("largest\(largest)")
                }
            }
        }
        
        
        
    }
    
    
}

