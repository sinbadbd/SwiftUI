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
        
        
        // Do any additional setup after loading the view.
        
//        showImage.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(tapCameraVC)))
        showImage.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapCameraVC))
                   tapGestureRecognizer.numberOfTapsRequired = 1
                    showImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showImage.image = frontImage

    }

    @objc func tapCameraVC(){
        print(".....")
        
        let vc = CustomCamera()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
