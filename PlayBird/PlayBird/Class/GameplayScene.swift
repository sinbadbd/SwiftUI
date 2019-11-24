//
//  GameplayScene.swift
//  PlayBird
//
//  Created by Imran on 24/11/19.
//  Copyright © 2019 Im. All rights reserved.
//

 import SpriteKit

class GameplayScene: SKScene {
    override func didMove(to view: SKView) {
        initialize()
    }
    func initialize(){
       createBackground()
    }
    
    func createBackground() {
        for i in 0...2 {
            let bg = SKSpriteNode(imageNamed: "BG Day")
            bg.name = "BG"
            bg.zPosition = 0
            bg.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            bg.position =  CGPoint(x: CGFloat(i) * bg.size.width, y: 0)
            self.addChild(bg)
        }
    }
}
