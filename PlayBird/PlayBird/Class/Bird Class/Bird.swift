//
//  Bird.swift
//  PlayBird
//
//  Created by Imran on 24/11/19.
//  Copyright © 2019 Im. All rights reserved.
//

import SpriteKit
class Bird : SKSpriteNode {
    func initalize (){
        self.name = "Bird"
        self.zPosition = 3
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
}
