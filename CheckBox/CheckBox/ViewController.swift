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
    var isChecked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        conditionCheckbox.setImage(UIImage(named: "checkbox"), for: .normal)
//        conditionCheckbox.setImage(UIImage(named: "check"), for: .selected)
        conditionCheckbox.addTarget(self, action: #selector(handleCheckbox), for: .touchUpInside)
     }
   
    @objc func handleCheckbox(_ sender: UIButton){
        //sender.setImage(uncheckedImage, for: .normal)
        if isChecked == false {
            sender.setImage(checkedImage, for: .normal)
            isChecked = true
            print(isChecked,"A")

        }else {
            sender.setImage(uncheckedImage, for: .normal)
            isChecked = false
            print(isChecked,"B")
        }
        
//        sender.isSelected = !sender.isSelected
//        sender.transform = .identity
    }
}

