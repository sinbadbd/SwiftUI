//
//  Bird.swift
//  PlayBird
//
//  Created by Imran on 24/11/19.
//  Copyright © 2019 Im. All rights reserved.
//

import SpriteKit


struct ColliderType {
    static let Bird: UInt32 = 1
    static let Ground: UInt32 = 2
    static let Pipes: UInt32 = 3
    static let Score: UInt32 = 4
}



class Bird : SKSpriteNode {
    
    func initalize (){
        self.name = "Bird"
        self.zPosition = 3
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height / 2)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = ColliderType.Bird
        self.physicsBody?.collisionBitMask = ColliderType.Ground | ColliderType.Pipes
        self.physicsBody?.contactTestBitMask = ColliderType.Ground | ColliderType.Pipes | ColliderType.Score
    }
    
    func flap (){
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 120))
    }
}
