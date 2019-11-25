//
//  GameplayScene.swift
//  PlayBird
//
//  Created by Imran on 24/11/19.
//  Copyright © 2019 Im. All rights reserved.
//

import SpriteKit



class GameplayScene: SKScene {
    
    var bird = Bird()
    var pipeHolder = SKNode()
    
    
    override func didMove(to view: SKView) {
        initialize()
    }
    override func update(_ currentTime: TimeInterval) {
        moveBG()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        bird.flap()
    }
    
    func initialize(){
        createBackground()
        createGround()
        createBird()
        createPipe()
        spwanObstacles()
    }
    
    
    func createBird(){
        bird  = Bird(imageNamed: "Blue 1")
        bird.initalize()
        bird.position = CGPoint(x: -50, y: 0 )
        addChild(bird)
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
    
    func createGround (){
        for i in 0...2 {
            let ground = SKSpriteNode(imageNamed: "Ground")
            ground.name = "Ground"
            ground.zPosition = 4
            ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -(self.frame.height / 2))
            ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
            ground.physicsBody?.affectedByGravity = false
            ground.physicsBody?.isDynamic = false
            ground.physicsBody?.categoryBitMask = ColliderType.Ground
//            ground.physicsBody?.collisionBitMask = ColliderType.Bird
//            ground.physicsBody?.contactTestBitMask = ColliderType.Bird
            addChild(ground)
        }
    }
    
    func moveBG(){
        enumerateChildNodes(withName: "BG") { (node, _) in
            node.position.x -= 4.5
            if node.position.x < -(self.frame.width) {
                node.position.x += self.frame.width * 3
            }
        }
        enumerateChildNodes(withName: "Ground") { (node, _) in
            node.position.x -= 2
            if node.position.x < -(self.frame.width) {
                node.position.x += self.frame.width * 3
            }
        }
    }
    
    
    func createPipe(){
        pipeHolder = SKNode()
        pipeHolder.name = "Holder"
        
        
        let pipeUP = SKSpriteNode(imageNamed: "Pipe 1")
        let pipeDown = SKSpriteNode(imageNamed: "Pipe 1")
        
        pipeUP.name = "Pipe"
        pipeUP.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pipeUP.position = CGPoint(x: 0, y: 600)
        pipeUP.zRotation = CGFloat(3.14)
        pipeUP.yScale = 1.5
        pipeUP.physicsBody = SKPhysicsBody(rectangleOf: pipeUP.size)
        pipeUP.physicsBody?.collisionBitMask = ColliderType.Pipes
        pipeUP.physicsBody?.affectedByGravity = false
        pipeUP.physicsBody?.isDynamic = false
 
        pipeDown.name = "Pipe"
        pipeDown.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pipeDown.position = CGPoint(x: 0, y: -600)
        pipeDown.yScale = 1.5
        pipeDown.physicsBody = SKPhysicsBody(rectangleOf: pipeDown.size)
        pipeDown.physicsBody?.collisionBitMask = ColliderType.Pipes
        pipeDown.physicsBody?.affectedByGravity = false
        pipeDown.physicsBody?.isDynamic = false
 
        
        pipeHolder.zPosition = 5
//        pipeHolder.position = CGPoint(x: 300, y: 0)
        pipeHolder.position.x = self.frame.width + 100
        pipeHolder.position.y = CGFloat.randomBetween(min: -300, max: 300)
        pipeHolder.addChild(pipeUP)
        pipeHolder.addChild(pipeDown)
        
        addChild(pipeHolder)
        
        let destination = self.frame.width * 2
        let move = SKAction.moveTo(x: -destination, duration: 10)
        let remove = SKAction.removeFromParent()
        
        pipeHolder.run(SKAction.sequence([move, remove]), withKey: "Move")
    }
    
    
    func spwanObstacles(){
        let spawn = SKAction.run {
            self.createPipe()
        }
        let deley = SKAction.wait(forDuration: 2)
        let sequence = SKAction.sequence([spawn, deley])
        
        self.run(SKAction.repeatForever(sequence), withKey: "Spawn")
    }
}
