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
    
    
    let zombieMovePointsPerSec : CGFloat = 4.0 * .pi
    var velocity = CGPoint.zero
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
        
        print("offset \(offset)")
        //Step 2: Find the length of the offset vector
        let length = sqrt(Double(offset.x * offset.x + offset.y * offset.y))
        print("length \(length)")
        
        // Step 3: Make the offset vector a set length
        let direction = CGPoint(x: offset.x / CGFloat(length), y: offset.y / CGFloat(length))
        print("length \(direction)")
        
        
        velocity = CGPoint(x: direction.x * zombieMovePointsPerSec, y: direction.y * zombieMovePointsPerSec)
        print("velocity \(velocity)")
        
        
    }
    
    // Step 4: Hook up to touch events
    
    func sceneTouched(touchLocation: CGPoint) {
        moveZombieToward(location: touchLocation)
    }
    
    //Rotating the zombie
    func rotateSprite(sprite: SKSpriteNode, direction: CGPoint, rotateRadiansPerSec: CGFloat){
        sprite.zRotation = CGFloat(atan2(Double(direction.y), Double(direction.x)))
    }
    
    
    // Touch Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let touchLocation = touch.location(in: self)
            sceneTouched(touchLocation: touchLocation)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let touchLocation = touch.location(in: self)
            sceneTouched(touchLocation: touchLocation)
        }
    }
    
    // Iteration 4: Bounds checking
    
    func boundsCheckZombie() {
        let bottomLeft = CGPoint.zero
        let topRight = CGPoint(x: size.width, y: size.height)
        
        
        if zombie.position.x <= bottomLeft.x {
            zombie.position.x = bottomLeft.x
            velocity.x = -velocity.x
        }
        if zombie.position.y <= bottomLeft.y {
            zombie.position.y = bottomLeft.y
            velocity.y = -velocity.y
        }
        
        if zombie.position.x >= topRight.x {
            zombie.position.x = topRight.x
            velocity.x  = -velocity.x
        }
        
        if zombie.position.y >= topRight.y {
            zombie.position.y = topRight.y
            velocity.y  = -velocity.y
        }
        
    }
    
    
    func setupPlayer (){
        zombie.position = CGPoint(x: 400, y: 400)
        addChild(zombie)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //  zombie.position = CGPoint(x: zombie.position.x + 4, y: zombie.position.y)
        moveSprite(sprite: zombie, velocity: velocity)
        boundsCheckZombie()
        rotateSprite(sprite: zombie, direction: velocity, rotateRadiansPerSec: shortestAngleBetween(angle1: CGFloat(sign(dt)), angle2: CGFloat(sign(dt))))
        
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        print("\(dt * 1000)")
    }
}
