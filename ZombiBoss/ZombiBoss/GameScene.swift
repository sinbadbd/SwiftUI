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
    
     
     let zombie = SKSpriteNode(imageNamed: "zombie1")
    
    
    let zombieMovePointsPerSec : CGFloat = 480.0
    var velocity = CGPoint(x: 0, y: 0)
    var lastUpdateTime : TimeInterval = 0
    var dt: TimeInterval = 0
    
    
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width / 2 , y: size.height / 2)
        background.zPosition = -1
        addChild(background)
        
        setupPlayer()
    }
    //Iteration 2: Velocity multiplied by delta time
    func moveSprite(sprite: SKSpriteNode, velocity: CGPoint){
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt), y: velocity.y * CGFloat(dt))
        print(amountToMove)
        
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x, y: sprite.position.y + amountToMove.y)
    
    }
    
    //Iteration 3: Moving toward touches
    
    func moveZombieToward(location: CGPoint) {
        // Step 1: Find the offset vector
        let offset = CGPoint(x: location.x - zombie.position.x, y: location.y - zombie.position.y)
        
        //Step 2: Find the length of the offset vector
    }
    
    
    
    func setupPlayer (){
        zombie.position = CGPoint(x: 400, y: 400)
        addChild(zombie)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
      //  zombie.position = CGPoint(x: zombie.position.x + 4, y: zombie.position.y)
        moveSprite(sprite: zombie, velocity: CGPoint(x: zombieMovePointsPerSec, y: 0))
        
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        print("\(dt * 1000)")
    }
}
