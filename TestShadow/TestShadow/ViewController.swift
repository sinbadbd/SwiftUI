//
//  ViewController.swift
//  TestShadow
//
//  Created by Imran on 28/11/19.
//  Copyright © 2019 Im. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewBG : UIView = UIView()
    private var shadowLayer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        //setupFreamShadow()
        setupView()
    }
    func setupFreamShadow(){
        viewBG.frame = CGRect(x: 60, y: 200, width: 300, height: 300)
        viewBG.dropShadow(color: .gray, opacity: 0.5, offSet: CGSize(width: 1, height: 1), shadowRadius: 5, scale: true, cornerRadius: 2)
        view.addSubview(viewBG)
    }
    
    // Creates your mainView
    var mainView: UIView = {
        let view = UIView()
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Creates your contentsLayer
    // Add all your subsequent subviews to your contentsLayer
    var contentsLayer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupView() {
        view.backgroundColor = .white
        
        
        view.addSubview(mainView)
       mainView.addSubview(contentsLayer)
        
        mainView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 40, bottom: 0, right: 40), size: CGSize(width: 100, height: 100))
        
        
       contentsLayer.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 40, bottom: 0, right: 40), size: CGSize(width: 100, height: 100))
        
    }
    
}

extension UIView {
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, shadowRadius: CGFloat = 1, scale: Bool = true, cornerRadius: CGFloat) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = offSet
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = shadowRadius
        layer.insertSublayer(shadowLayer, at: 0)
    }
}
