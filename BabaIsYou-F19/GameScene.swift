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
    let playerSpeed:CGFloat =  20

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
         self.stopblock = self.scene?.childNode(withName: "stopblock") as! SKSpriteNode
        self.player = self.scene?.childNode(withName: "player") as! SKSpriteNode
        
        self.player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        self.player.physicsBody?.isDynamic = true
        self.player.physicsBody?.affectedByGravity = false
        self.player.physicsBody?.allowsRotation = false
        
        
        self.stopblock.physicsBody?.isDynamic = true
        self.stopblock.physicsBody = SKPhysicsBody(rectangleOf: stopblock.size)
       self.stopblock.physicsBody?.affectedByGravity = false
        self.stopblock.physicsBody?.allowsRotation = false
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
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
