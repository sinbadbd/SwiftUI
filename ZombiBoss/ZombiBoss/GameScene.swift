//
//  GameScene.swift
//  ZombiBoss
//
//  Created by Imran on 30/10/19.
//  Copyright © 2019 Imran. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
     
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width / 2 , y: size.height / 2)
        addChild(background)
    }
    
  
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
