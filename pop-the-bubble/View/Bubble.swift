//
//  Bubble.swift
//  bubble-pop
//
//  Created by Anurita Srivastava on 10/11/18.
//  Copyright © 2018 ANurita Srivastava. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation

class Bubble: SKScene {

    let ballCategory: UInt32 = 0xb0001
    let edgeCategory: UInt32 = 0xb0010
    var nodeCount = 0
    let store = UserDefaults.standard

    override func didMove(to view: SKView){
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

