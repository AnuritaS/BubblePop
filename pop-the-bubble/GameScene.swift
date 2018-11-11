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

class GameScene: SKScene, SKPhysicsContactDelegate {
 var ballCategory: UInt32 = 0xb0001
 var edgeCategory: UInt32 = 0xb0010
var nodeCount = 0
    let d = UserDefaults.standard

    override func didMove(to view: SKView){

        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        runActions()
    }

    func runActions(number: Int = 0){
        let numberOfBubbles = d.integer(forKey: "Bubbles")

       // let w = SKAction.wait(forDuration: 1)
        let makeAbubble = SKAction.run {
            self.makebubble()
        }

        let seq = SKAction.sequence([makeAbubble])
        let req = SKAction.repeat(seq, count: numberOfBubbles-number)

        run (req)

    }

    func makebubble() {

        // define a size for a bubble
        let bubbleTexture = SKTexture(imageNamed: "bubble")

        let bubble = SKSpriteNode(texture: bubbleTexture)
        let bphysicsBody = SKPhysicsBody(circleOfRadius: bubbleTexture.size().height/2)

        bphysicsBody.isDynamic = true
        bphysicsBody.categoryBitMask = ballCategory
        bphysicsBody.collisionBitMask = ballCategory | edgeCategory
        bphysicsBody.contactTestBitMask = ballCategory | edgeCategory
        bphysicsBody.applyImpulse(CGVector(dx: 2.0, dy: -2.0))
        bphysicsBody.usesPreciseCollisionDetection = true
        bphysicsBody.restitution = 1
        bphysicsBody.friction = 0
        bphysicsBody.angularDamping = 0
        bphysicsBody.linearDamping = 0
        bubble.physicsBody = bphysicsBody
        bubble.name = "bubble"

        let edge = SKPhysicsBody(edgeLoopFrom: self.frame)
        edge.categoryBitMask = edgeCategory
        edge.contactTestBitMask = ballCategory
        edge.collisionBitMask = ballCategory
        edge.usesPreciseCollisionDetection = true
        edge.friction = 0
        self.physicsBody = edge

        // Get a random possition within the width of the scene
        let x = CGFloat(randomize(number: Int(size.width - 40)) + 20)
        let y = CGFloat(randomize(number: Int(size.height - 40)) + 20)

        // position the bubble
        bubble.position.x = x
        bubble.position.y = y

        // craete an action to move the move up teh screen
       // let float = SKAction.repeatForever(SKAction.moveTo(y: +yScale, duration: 6))

       // bubble.run(float)
 // Add the bubble
        addMyChild(node: bubble)

    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            let node = atPoint(location)
            if node.name == "bubble" {
                removeMyChild(node: node)
            }
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print("Collision")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
// print("Collision Ended")
    }
    
}

extension GameScene{

    func addMyChild(node:SKSpriteNode){
        self.addChild(node)
        nodeCount += 1
    }

    func removeMyChild(node:SKNode){
       node.removeFromParent()
        nodeCount -= 1
         print("count",nodeCount)
        if nodeCount <= 4{
runActions(number: 4)
        }
    }

    // function that returns a random int from 0 to n-1
    func randomize(number: Int) -> Int{
        return Int(arc4random()) % number
    }

}
