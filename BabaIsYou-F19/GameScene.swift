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
    var player:SKSpriteNode!
    var stopblock:SKSpriteNode!
    var wallBlock:SKSpriteNode!
    var flagBlock:SKSpriteNode!
    var winBlock:SKSpriteNode!
    var flag:SKSpriteNode!
    var wall:SKSpriteNode!
    var isBlock:SKSpriteNode!
    let playerSpeed:CGFloat =  20
    var ConditionOne = false
    var ConditionTwo = false
    var ConditionThree = false
    var ConditionFour = false
    
    var spriteArray:[SKSpriteNode] = []

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.stopblock = self.scene?.childNode(withName: "stopblock") as? SKSpriteNode
        self.player = self.scene?.childNode(withName: "player") as? SKSpriteNode
        self.wallBlock = self.scene?.childNode(withName: "wallblock") as? SKSpriteNode
        self.flagBlock = self.scene?.childNode(withName: "flagblock") as? SKSpriteNode
        self.winBlock = self.scene?.childNode(withName: "winblock") as? SKSpriteNode
        self.flag = self.scene?.childNode(withName: "flag") as? SKSpriteNode
         self.wall = self.scene?.childNode(withName: "wall") as? SKSpriteNode
         self.isBlock = self.scene?.childNode(withName: "isblock") as? SKSpriteNode
    
        self.player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        self.player.physicsBody?.isDynamic = true
        self.player.physicsBody?.affectedByGravity = false
        self.player.physicsBody?.allowsRotation = false
         self.player.physicsBody?.categoryBitMask = 1
        self.player.physicsBody?.contactTestBitMask = 0
        
        
        self.stopblock.physicsBody?.isDynamic = true
        self.stopblock.physicsBody = SKPhysicsBody(rectangleOf: stopblock.size)
       self.stopblock.physicsBody?.affectedByGravity = false
        self.stopblock.physicsBody?.allowsRotation = false
        self.stopblock.physicsBody?.categoryBitMask = 2
        self.stopblock.physicsBody?.contactTestBitMask = 23
        
        
        self.enumerateChildNodes(withName: "isblock") {
            (node, stop) in
            let isBlock = node as! SKSpriteNode
            isBlock.physicsBody = SKPhysicsBody(rectangleOf: isBlock.size)
            isBlock.physicsBody?.affectedByGravity = false
            isBlock.physicsBody?.allowsRotation = false
            isBlock.physicsBody?.isDynamic = false
            isBlock.physicsBody?.categoryBitMask = 4
            self.spriteArray.append(isBlock)
        }
        
        self.enumerateChildNodes(withName: "wall") {
            (node, stop) in
            let wall = node as! SKSpriteNode
            wall.physicsBody = SKPhysicsBody(rectangleOf: wall.size)
            wall.physicsBody?.affectedByGravity = false
            wall.physicsBody?.allowsRotation = false
            wall.physicsBody?.isDynamic = false
            wall.physicsBody?.categoryBitMask = 16
            self.spriteArray.append(wall)
        }
        
        self.wallBlock.physicsBody = SKPhysicsBody(rectangleOf: wallBlock.size)
        self.wallBlock.physicsBody?.isDynamic = true
        self.wallBlock.physicsBody?.affectedByGravity = false
        self.wallBlock.physicsBody?.allowsRotation = false
        self.wallBlock.physicsBody?.categoryBitMask = 8
        self.wallBlock.physicsBody?.contactTestBitMask = 23
        
        self.winBlock.physicsBody = SKPhysicsBody(rectangleOf: winBlock.size)
        self.winBlock.physicsBody?.isDynamic = true
        self.winBlock.physicsBody?.affectedByGravity = false
        self.winBlock.physicsBody?.allowsRotation = false
        self.winBlock.physicsBody?.categoryBitMask = 32
         self.winBlock.physicsBody?.contactTestBitMask = 4
        self.spriteArray.append(winBlock)
        
        self.flagBlock.physicsBody = SKPhysicsBody(rectangleOf: flagBlock.size)
        self.flagBlock.physicsBody?.isDynamic = true
        self.flagBlock.physicsBody?.affectedByGravity = false
        self.flagBlock.physicsBody?.allowsRotation = false
        self.flagBlock.physicsBody?.categoryBitMask = 64
         self.flagBlock.physicsBody?.contactTestBitMask = 4
        
        self.flag.physicsBody = SKPhysicsBody(rectangleOf: flag.size)
        self.flag.physicsBody?.isDynamic = false
        self.flag.physicsBody?.affectedByGravity = false
        self.flag.physicsBody?.allowsRotation = false
        self.flag.physicsBody?.categoryBitMask = 128
        self.flag.physicsBody?.contactTestBitMask = 1
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
        
        if (nodeX!.name != "isblock" && nodeY!.name != "wallblock") {
            // output game win
            print("wall deactivated")
            self.enumerateChildNodes(withName: "wall") {
                                (node, stop) in
                                let wall = node as! SKSpriteNode
                                //wall.physicsBody = SKPhysicsBody(rectangleOf: wall.size)
                                wall.physicsBody?.affectedByGravity = false
                                wall.physicsBody?.allowsRotation = false
                                wall.physicsBody?.isDynamic = false
                                wall.physicsBody?.categoryBitMask = 0
                                self.spriteArray.append(wall)
                            }
            
        }
        if (nodeX!.name != "isblock" && nodeY!.name != "stopblock") {
            // output game win
            print("wall deactivated")
            self.enumerateChildNodes(withName: "wall") {
                (node, stop) in
                let wall = node as! SKSpriteNode
                wall.physicsBody = SKPhysicsBody(rectangleOf: wall.size)
                wall.physicsBody?.affectedByGravity = false
                wall.physicsBody?.allowsRotation = false
                wall.physicsBody?.isDynamic = false
                wall.physicsBody?.categoryBitMask = 0
                self.spriteArray.append(wall)
            }
            
        }
        
        if (nodeX!.name == "isblock" && nodeY!.name == "flagblock") {
            // output game win
            print("win")
            
            self.ConditionOne = true

        }
        if (nodeX!.name == "isblock" && nodeY!.name == "winblock") {
            // output game win
            print("win2")
            
            self.ConditionTwo = true

        }
        if (nodeX!.name == "flag" && nodeY!.name == "player") {
            // output game win
            print("flag Touched ")
            
            self.ConditionFour = true
            
        }

        if(self.ConditionOne == true && self.ConditionTwo == true)
        {
            print("Rules Active => now Touch the Flag!")
            self.ConditionThree = true
            
        }
        if(self.ConditionThree == true && self.ConditionFour == true)
        {
            print("game win sem final done!")
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
