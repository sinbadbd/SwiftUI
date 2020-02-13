//
//  ViewController.swift
//  CheckBox
//
//  Created by Imran on 13/2/20.
//  Copyright © 2020 Im. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var conditionCheckbox: UIButton!
    
    let checkedImage = UIImage(named: "check_box")! as UIImage
    let uncheckedImage = UIImage(named: "uncheck_box")! as UIImage
    // declare bool
    var unchecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        conditionCheckbox.setImage(UIImage(named: "checkbox"), for: .normal)
//        conditionCheckbox.setImage(UIImage(named: "check"), for: .selected)
        conditionCheckbox.addTarget(self, action: #selector(handleCheckbox), for: .touchUpInside)
     }
   
    @objc func handleCheckbox(_ sender: UIButton){
        //sender.setImage(uncheckedImage, for: .normal)
        if unchecked == false{
            sender.setImage(checkedImage, for: .normal)
            unchecked = true
            print(unchecked,"A")

        }else {
            sender.setImage(uncheckedImage, for: .normal)
            unchecked = false
            print(unchecked,"B")
        }
        
//        sender.isSelected = !sender.isSelected
//        sender.transform = .identity
    }
}

