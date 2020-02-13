//
//  RegistratioinVC.swift
//  ScrollViewPerticular
//
//  Created by Imran on 12/2/20.
//  Copyright © 2020 Im. All rights reserved.
//

import UIKit

class RegistratioinVC: UIViewController {

    @IBOutlet weak var viewContainer: UIView!
    
    var mayanmarView : UIView!
    var foreginView : UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainer.layer.cornerRadius = 10
        
        mayanmarView = MayanmarView().view
        foreginView = ForeignView().view
        
        viewContainer.addSubview(foreginView)
        viewContainer.addSubview(mayanmarView)
     }
    
    @IBAction func changeViewAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            viewContainer.bringSubviewToFront(mayanmarView)
            break
            
          case 1:    viewContainer.bringSubviewToFront(foreginView)
             break
        default:
           
            break
        }
    }
}
