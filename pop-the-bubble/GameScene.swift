//
//  GameScene.swift
//  bubble-pop
//
//  Created by Anurita Srivastava on 10/11/18.
//  Copyright © 2018 ANurita Srivastava. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation

class GameScene: SKScene,SKPhysicsContactDelegate {
 var ballCategory: UInt32 = 0xb0001
 var baCategory: UInt32 = 0xb0010
       var numberOfBubbles: Int!
    override func didMove(to view: SKView){

physicsWorld.contactDelegate = self
    let w = SKAction.wait(forDuration: 3)
        let makeABox = SKAction.run {
            self.makeBox()
        }

        let seq = SKAction.sequence([w,makeABox])
        let req = SKAction.repeat(seq, count: numberOfBubbles)
        
        run (req)

        //}
    }
    
    func makeBox() {
        
        // define a size for a box
           let box = SKSpriteNode(imageNamed: "circle")
        box.physicsBody =  SKPhysicsBody(circleOfRadius: box.frame.size.width/2)
        box.physicsBody?.isDynamic = true
        box.physicsBody?.categoryBitMask = ballCategory
        box.physicsBody?.collisionBitMask = ballCategory | baCategory
        box.physicsBody?.contactTestBitMask = ballCategory | baCategory

        box.physicsBody?.usesPreciseCollisionDetection = true
        box.name = "box"

        let edge = SKPhysicsBody(edgeLoopFrom: (view?.scene?.frame)!)
        edge.categoryBitMask = baCategory
        edge.contactTestBitMask = ballCategory
        edge.collisionBitMask = ballCategory

        // Get a random possition within the width of the scene
        let x = CGFloat(randomize(number: Int(size.width - 40)) + 20)
        let y = CGFloat(randomize(number: Int(size.height - 40)) + 20)

        // position the box
        box.position.x = size.width/2
        box.position.y = size.height/4
        box.physicsBody?.restitution = 1.0
        // Add the box
        addChild(box)
        box.physicsBody?.applyForce(CGVector(dx: -20, dy: 30))
        // craete an action to move the move up teh screen
        let moveUp = SKAction.moveTo(y: size.height/2, duration: 4)
        let seq = SKAction.sequence([moveUp])
        box.run(seq)

    }
    
    // function that returns a random int from 0 to n-1
    func randomize(number: Int) -> Int{
        return Int(arc4random()) % number
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            let node = atPoint(location)
            if node.name == "box" {
                node.removeFromParent()
            }
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print("Collision")
    }
    
}
