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

class GameScene: SKScene {

    let ballCategory: UInt32 = 0xb0001
    let edgeCategory: UInt32 = 0xb0010
    let BottomCategory : UInt32 = 0x1 << 1
    var nodeCount = 0
    let store = UserDefaults.standard

    override func didMove(to view: SKView){
view.backgroundColor = UIColor.blue
        //set physicsWorld properties
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)

        //set edges as PhysicsBody
        let edge = SKPhysicsBody(edgeLoopFrom: self.frame)
        edge.friction = 0
        edge.categoryBitMask = edgeCategory
        self.physicsBody = edge

        runActions()
    }

    func runActions(number: Int = 0){

        let numberOfBubbles = store.integer(forKey: "Bubbles")

        let makeAbubble = SKAction.run {
            self.makebubble()
        }

        let sequence = SKAction.sequence([makeAbubble])
        let request = SKAction.repeat(sequence, count: numberOfBubbles-number)

        run(request)

    }

    func makebubble() {

        let bubbleTexture = SKTexture(imageNamed: "bubble")
        let bubble = SKSpriteNode(texture: bubbleTexture)
        let bphysicsBody = SKPhysicsBody(circleOfRadius: bubbleTexture.size().height/2)

        bphysicsBody.isDynamic = true
        bphysicsBody.usesPreciseCollisionDetection = true
        bphysicsBody.restitution = 1
        bphysicsBody.friction = 0
        bphysicsBody.angularDamping = 0
        bphysicsBody.linearDamping = 0
        bphysicsBody.categoryBitMask = ballCategory
        bphysicsBody.collisionBitMask = ballCategory | edgeCategory
        bphysicsBody.contactTestBitMask = ballCategory | edgeCategory
        bubble.physicsBody = bphysicsBody
        bubble.name = "bubble"

        // Get a random possition within the width of the scene
        let x = CGFloat(randomize(number: Int(size.width - 40)))
        let y = CGFloat(randomize(number: Int(size.height - 40)))

        // position the bubble
        bubble.position.x = x
        bubble.position.y = y

        // Add the bubble
        addMyChild(node: bubble)
    }
}

extension GameScene: SKPhysicsContactDelegate{

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        if let touch = touches.first {
            let location = touch.location(in: self)
            let node = atPoint(location)
            if node.name == "bubble" {
                removeMyChild(node: node)
            }
        }
    }
}

extension GameScene{

    func addMyChild(node:SKSpriteNode){
        self.addChild(node)
        node.physicsBody!.applyImpulse(CGVector(dx: 10.0, dy: -2.0))
        nodeCount += 1
    }

    func removeMyChild(node:SKNode){
       node.removeFromParent()
        nodeCount -= 1
        if nodeCount <= 4{
            runActions(number: 4)
        }
    }

    // function that returns a random int from 0 to n-1
    func randomize(number: Int) -> Int{
        return Int(arc4random()) % number
    }

}
