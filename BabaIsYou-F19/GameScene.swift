//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var player:SKSpriteNode! = nil
    var stopblock:SKSpriteNode! = nil
    var wallBlock:SKSpriteNode! = nil
    var flagBlock:SKSpriteNode! = nil
    var winBlock:SKSpriteNode! = nil
    var flag:SKSpriteNode! = nil
    let playerSpeed:CGFloat =  40
    
    var spriteArray:[SKSpriteNode] = []

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.stopblock = self.scene?.childNode(withName: "stopblock") as! SKSpriteNode
        self.player = self.scene?.childNode(withName: "player") as! SKSpriteNode
        self.wallBlock = self.scene?.childNode(withName: "wallblock") as! SKSpriteNode
        self.flagBlock = self.scene?.childNode(withName: "flagblock") as! SKSpriteNode
        self.winBlock = self.scene?.childNode(withName: "winblock") as! SKSpriteNode
        self.flag = self.scene?.childNode(withName: "flag") as! SKSpriteNode
    
        self.player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        self.player.physicsBody?.isDynamic = true
        self.player.physicsBody?.affectedByGravity = false
        self.player.physicsBody?.allowsRotation = false
         self.player.physicsBody?.categoryBitMask = 1
        
        
        self.stopblock.physicsBody?.isDynamic = true
        self.stopblock.physicsBody = SKPhysicsBody(rectangleOf: stopblock.size)
       self.stopblock.physicsBody?.affectedByGravity = false
        self.stopblock.physicsBody?.allowsRotation = false
        self.player.physicsBody?.categoryBitMask = 2
        
        self.enumerateChildNodes(withName: "isblock") {
            (node, stop) in
            let isBlock = node as! SKSpriteNode
            isBlock.physicsBody = SKPhysicsBody(rectangleOf: isBlock.size)
            isBlock.physicsBody?.affectedByGravity = false
            isBlock.physicsBody?.allowsRotation = false
            isBlock.physicsBody?.isDynamic = true
            isBlock.physicsBody?.categoryBitMask = 4
            self.spriteArray.append(isBlock)
        }
        
        self.wallBlock.physicsBody = SKPhysicsBody(rectangleOf: wallBlock.size)
        self.wallBlock.physicsBody?.isDynamic = true
        self.wallBlock.physicsBody?.affectedByGravity = false
        self.wallBlock.physicsBody?.allowsRotation = false
        self.wallBlock.physicsBody?.categoryBitMask = 8
        self.wallBlock.physicsBody?.contactTestBitMask = 239
        
        self.winBlock.physicsBody = SKPhysicsBody(rectangleOf: winBlock.size)
        self.winBlock.physicsBody?.isDynamic = true
        self.winBlock.physicsBody?.affectedByGravity = false
        self.winBlock.physicsBody?.allowsRotation = false
        self.winBlock.physicsBody?.categoryBitMask = 32
         self.winBlock.physicsBody?.contactTestBitMask = 239
        self.spriteArray.append(winBlock)
        
        self.flagBlock.physicsBody = SKPhysicsBody(rectangleOf: flagBlock.size)
        self.flagBlock.physicsBody?.isDynamic = true
        self.flagBlock.physicsBody?.affectedByGravity = false
        self.flagBlock.physicsBody?.allowsRotation = false
        self.flagBlock.physicsBody?.categoryBitMask = 64
        
        self.flag.physicsBody = SKPhysicsBody(rectangleOf: flag.size)
        self.flag.physicsBody?.isDynamic = false
        self.flag.physicsBody?.affectedByGravity = false
        self.flag.physicsBody?.allowsRotation = false
        self.flag.physicsBody?.categoryBitMask = 128
        self.flag.physicsBody?.contactTestBitMask = 239
        self.spriteArray.append(flag)

    }
   
    func didBegin(_ contact: SKPhysicsContact) {
       // print("Something collided!")
        
        let nodeX = contact.bodyA.node
        let nodeY = contact.bodyB.node
        if(nodeX == nil || nodeY == nil)
        {
            return
        }
        
        if (nodeX!.name == "flag" && nodeY!.name == "winBlock") {
            // output game win
            print("1GAME WIN! => Reaching Next level")
           
        }
        if (nodeX!.name == "winBlock" && nodeY!.name == "flag") {
            // output game win
            print("action")
            
        }
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
//        let arr:Array = self.spriteArray
//        print("arrayItems: \(arr)")
//        let indexA = self.spriteArray.index(after: -1)
//        print(indexA)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let mouseTouch = touches.first
        if (mouseTouch == nil)
        {
            return
        }
        
        let location = mouseTouch!.location(in: self)
        let nodeTouched = atPoint(location).name
        // print("Player Touched \(nodeTouched)")
        
        if(nodeTouched == "btnUP")
        {
            self.player.position.y = self.player.position.y + playerSpeed
        }
        else if(nodeTouched == "btnDown")
        {
            self.player.position.y = self.player.position.y - playerSpeed
        }
        else if(nodeTouched == "btnRight")
        {
            self.player.position.x = self.player.position.x + playerSpeed
        }
        else if(nodeTouched == "btnLeft")
        {
            self.player.position.x = self.player.position.x - playerSpeed
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
