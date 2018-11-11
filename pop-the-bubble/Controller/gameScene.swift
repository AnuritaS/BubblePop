//
//  gameScene.swift
//  pop-the-bubble
//
//  Created by Anurita Srivastava on 11/11/18.
//  Copyright © 2018 Danh Phu Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation

extension Bubble: SKPhysicsContactDelegate{

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        if let touch = touches.first {
            let location = touch.location(in: self)
            let node = atPoint(location)
            if node.name == "bubble" {
                let skNode = node as? SKSpriteNode
                skNode?.texture = SKTexture(imageNamed: "circle")
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let node = atPoint(location)
            if node.name == "bubble" {
               removeMyChild(node: node)
            }
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                let location = touch.location(in: self)
                let node = atPoint(location)
                if node.name == "bubble" {
                    removeMyChild(node: node)
                }
            }
        }
}

extension Bubble{

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
