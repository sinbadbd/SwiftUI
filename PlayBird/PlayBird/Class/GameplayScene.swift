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
    
    override func didMove(to view: SKView) {
        initialize()
    }
    override func update(_ currentTime: TimeInterval) {
        moveBG()
        
    }



    func initialize(){
        createBackground()
        createGround()
        createBird()
     }
    
    
    func createBird(){
      bird.initalize()
        bird  = Bird(imageNamed: "Blue 1")
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
//            print(self.frame.height)
//            print(self.frame.height / 2 )
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
}
