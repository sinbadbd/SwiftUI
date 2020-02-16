//
//  PreviewVC.swift
//  CameraCustom
//
//  Created by Imran on 16/2/20.
//  Copyright © 2020 Im. All rights reserved.
//

import UIKit

class PreviewVC: UIViewController {

    @IBAction func CancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var image: UIImage?
    @IBOutlet weak var showImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage.image = self.image
        // Do any additional setup after loading the view.
    }
    

}
