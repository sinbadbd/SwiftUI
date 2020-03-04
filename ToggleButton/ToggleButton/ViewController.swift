//
//  ViewController.swift
//  ToggleButton
//
//  Created by Imran on 15/1/20.
//  Copyright © 2020 Im. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(toggleBT)
    }
    lazy var toggleBT: UIButton = {

        let button = UIButton()
        button.frame = CGRect(x: 40, y: 100, width: 200, height: 40)
//        button.backgroundColor = .orange
        button.isSelected = false   // optional(because by default sender.isSelected is false)
        button.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleToggleBT), for: .touchUpInside)
        return button
    }()

    @objc func handleToggleBT(sender: UIButton) {

        sender.isSelected = !sender.isSelected

        if sender.isSelected {

            print(sender.isSelected)
//            toggleBT.setTitle("ON", for: .normal)
            toggleBT.setImage(#imageLiteral(resourceName: "like-selected"), for: .normal)
        }

        else {

            print(sender.isSelected)
//            toggleBT.setTitle("OFF", for: .normal)
            toggleBT.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        }
    }

}

