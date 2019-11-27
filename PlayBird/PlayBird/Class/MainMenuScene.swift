//
//  MainMenuScene.swift
//  PlayBird
//
//  Created by Imran on 27/11/19.
//  Copyright © 2019 Im. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene : SKScene {
    override func didMove(to view: SKView) {
        initialize()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "Play" {
                let gamePlay =  GameplayScene(fileNamed: "GameplayScne")
                gamePlay?.scaleMode = .aspectFill
                self.view?.presentScene(gamePlay!, transition: SKTransition.doorway(withDuration: 1))
            }
        }
    }
    func initialize(){
        createBG()
        createButtons()
    }
    
    
    func createBG(){
        let bg = SKSpriteNode(imageNamed: "BG Day")
        bg.name = "BG"
        bg.zPosition = 1
        bg.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(bg)
    }
    
    func createButtons () {
        let play = SKSpriteNode(imageNamed: "Play")
        let hightScore = SKSpriteNode(imageNamed: "Highscore")

        play.name = "Play"
        play.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        play.position = CGPoint(x: -100, y: -50)
        play.setScale(1.3)
        play.zPosition = 2
        play.size = CGSize(width: 150, height: 100)
        addChild(play)

        hightScore.name = "Highscore"
        hightScore.zPosition =  2
        hightScore.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        hightScore.position = CGPoint(x: 100, y: -50)
        hightScore.setScale(1.3)
        hightScore.size = CGSize(width: 150, height: 100)
        addChild(hightScore)
    }
}
