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
    
    
    let zombieMovePointsPerSec : CGFloat = 100.0 * .pi
    var velocity = CGPoint.zero
    var lastUpdateTime : TimeInterval = 0
    var dt: TimeInterval = 0
    
    var playableRect: CGRect
    
    var textures:[SKTexture] = []
    var zombieAnimation = SKAction()
    
    let catMovePointsPerSec: CGFloat = 480.0

    override init(size: CGSize) {
        
        let maxAscpectRatio:CGFloat = 16.0/9.0 // 1
        let playableHeight = size.width / maxAscpectRatio
        let playableMargin = (size.height - playableHeight) / 2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
        print("maxAscpectRatio== \(maxAscpectRatio).....playableHeight== \(playableHeight).....playableMargin== \(playableMargin)....playableRect== \(playableRect)")
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func debugDrawPlayableArea() {
        let shape = SKShapeNode()
        let path = CGMutablePath()
        path.addRect(playableRect)
        shape.path = path
        shape.strokeColor = SKColor.red
        shape.lineWidth = 4.0
        addChild(shape)
    }
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width / 2 , y: size.height / 2)
        background.zPosition = -1
        addChild(background)
        
        setupPlayer()
        // spawnEnemy()
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(spawnEnemy), SKAction.wait(forDuration: 2.0)])))
        
        // spawnCat()
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(spawnCat), SKAction.wait(forDuration: 1.0)])))
        debugDrawPlayableArea()
    }
    
    override func didEvaluateActions() {
        checkCollisions()
    }
    
    //Iteration 2: Velocity multiplied by delta time
    func moveSprite(sprite: SKSpriteNode, velocity: CGPoint){
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt), y: velocity.y * CGFloat(dt))
        print(amountToMove)
        
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x, y: sprite.position.y + amountToMove.y)
        
    }
    
    //Iteration 3: Moving toward touches
    
    func moveZombieToward(location: CGPoint) {
        //startZombieAnimation()
        
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
        let bottomLeft = CGPoint(x: 0, y: playableRect.minY)
        let topRight = CGPoint(x: size.width, y: playableRect.maxY)
        // print("bottomLeft:==\(bottomLeft) topRight==\(topRight)")
        
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
        
        for i in 1...4{
            textures.append(SKTexture(imageNamed: "zombie\(i)"))
            
        }
        textures.append(textures[2])
        textures.append(textures[1])
        zombieAnimation = SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1))
        zombie.run(SKAction.repeatForever(zombieAnimation))
        // startZombieAnimation()
        
    }
    func spawnEnemy(){
        let enemy = SKSpriteNode(imageNamed: "enemy")
        enemy.name = "enemy"
        enemy.position = CGPoint(x: size.width + enemy.size.width / 2 , y: CGFloat.random(min: playableRect.minY + enemy.size.height / 2, max: playableRect.maxY - enemy.size.height / 2))
        print("Enemy Postion : \(enemy.position)")
        addChild(enemy)
        
        
        
        //  let actionMidMove = SKAction.move(  to: CGPoint(x: size.width / 2 , y: playableRect.minX + enemy.size.height / 2), duration: 1.0)
        
        //  let actionMove = SKAction.move(to: CGPoint(x: -enemy.size.width/2 , y: enemy.position.y), duration: 1.00)
        // print("action Move: \(actionMove)")
        ///
        // let actionMidMove = SKAction.moveBy(x: -size.width / 2 - enemy.size.width / 2, y: -playableRect.height / 2 + enemy.size.height / 2 , duration: 1.0)
        
        // let actionMove = SKAction.moveBy(x: -size.width / 2 - enemy.size.width / 2, y: -playableRect.height / 2 - enemy.size.height / 2 , duration: 1.0)
        
        
        let actionMove = SKAction.moveTo(x: -enemy.size.width / 2, duration: 2.0)
        
        //        let reverseMid = actionMidMove.reversed()
        //        let reverseMove = actionMove.reversed()
        //        let sequence = SKAction.sequence([actionMidMove, actionMove, reverseMove, reverseMid ])
        ////
        //        let sequence = SKAction.sequence([actionMidMove, actionMove])
        let actionRemove = SKAction.removeFromParent()
        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }
    
    func startZombieAnimation(){
        if zombie.action(forKey: "animation") == nil {
            zombie.run(SKAction.repeatForever(zombieAnimation), withKey: "animation")
        }
    }
    func stopZombieAnimation(){
        zombie.removeAction(forKey: "animation")
    }
    
    
    func spawnCat(){
        let cat = SKSpriteNode(imageNamed: "cat")
//        cat.zPosition = 1
        cat.position = CGPoint(x: CGFloat.random(min: playableRect.minX, max: playableRect.maxX), y: CGFloat.random(min: playableRect.minY, max: playableRect.maxY))
        cat.setScale(0)
        addChild(cat)
        
        //Rotate action
        cat.zRotation = -.pi / 16.0
        let leftWiggle = SKAction.rotate(byAngle: .pi / 8.0, duration: 0.5)
        let rightWiggle = leftWiggle.reversed()
        let fullWiggle = SKAction.sequence([leftWiggle, rightWiggle])
        //  let wiggleWait = SKAction.repeat(fullWiggle, count: 10)
        
        
        //Group action
        let scaleUp = SKAction.scale(to: 1.0, duration: 0.25)
        let scaleDown = scaleUp.reversed()
        let fullScale = SKAction.sequence([scaleUp, scaleDown, scaleUp, scaleDown])
        let group = SKAction.group([fullScale, fullWiggle])
        let groupWait = SKAction.repeat(group, count: 10)
        
        //Scale action
        let appear = SKAction.scale(to: 1.0, duration: 0.5)
        // let wait = SKAction.wait(forDuration: 10.0)
        let disapper = SKAction.scale(to: 0, duration: 0.5)
        let removeFromParent = SKAction.removeFromParent()
        let actions = [appear, groupWait, disapper, removeFromParent]
        cat.run(SKAction.sequence(actions))
    }
    
    func zombieHitCat(cat: SKSpriteNode){
       // cat.removeFromParent()
       // cat.wasTurned = true
        cat.name = "train"
        cat.removeAllActions()
        cat.setScale(1.0)
        cat.zRotation = 0
        cat.run(
          SKAction.colorize(
            with: SKColor.green,
            colorBlendFactor: 1.0,
            duration: 0.2))
    }
    
    func zombieHitEnemy(enemy: SKSpriteNode){
        enemy.removeFromParent()
    }
    func checkCollisions(){
        var hitCats : [SKSpriteNode] = []
        enumerateChildNodes(withName: "cat") { (node, _) in
            let cat = node as! SKSpriteNode
            if cat.frame.intersects(self.zombie.frame){
                hitCats.append(cat)
                print("hit===\(hitCats.append(cat))")
            }
            for cat in hitCats {
                self.zombieHitCat(cat: cat)
                print(self.zombieHitCat(cat: cat))
            }
        }
        
        var hitEnemies : [SKSpriteNode] = []
        enumerateChildNodes(withName: "enemy") { (node, _) in
            let enemy = node as! SKSpriteNode
            if node.frame.insetBy(dx: 20, dy: 20).intersects(
                self.zombie.frame) {
                hitEnemies.append(enemy)
                
                let blinkTimes = 10.0
                let duration = 3.0
                let blinkAction = SKAction.customAction(withDuration: duration) {
                    node, elapsedTime in
                    let slice = duration / blinkTimes
                    let remainder = Double(elapsedTime).truncatingRemainder(dividingBy: slice)
                    node.isHidden = remainder > slice / 2
                }
            }
            for enemy in hitEnemies {
                self.zombieHitEnemy(enemy: enemy)
            }
        }
    }
    
    func moveTraing(){
        var trainCount = 0

        var targetPosition = zombie.position
        enumerateChildNodes(withName: "train") { (node, stop) in
            trainCount += 1
            if !node.hasActions(){
                let actionDuration = 0.3
                let offset = targetPosition - node.position
                let direction = offset.normalized()
                let amountToMovePerSec = direction * self.catMovePointsPerSec
                let amountToMove = amountToMovePerSec * CGFloat(actionDuration)
                let moveAction =  SKAction.moveBy(x: amountToMove.x, y: amountToMove.y, duration: actionDuration)
                node.run(moveAction)
            }
            targetPosition = node.position
            
            print(trainCount)
        }
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //  zombie.position = CGPoint(x: zombie.position.x + 4, y: zombie.position.y)
        moveSprite(sprite: zombie, velocity: velocity)
        stopZombieAnimation()
        
        boundsCheckZombie()
        rotateSprite(sprite: zombie, direction: velocity, rotateRadiansPerSec: shortestAngleBetween(angle1: CGFloat(sign(dt)), angle2: CGFloat(sign(dt))))
        checkCollisions()
        moveTraing()
        
        
        
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        print("\(dt * 1000)")
    }
}
