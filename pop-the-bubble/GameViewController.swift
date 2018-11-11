//
//  GameViewController.swift
//  bubble-pop
//
//  Created by Anurita Srivastava on 10/11/18.
//  Copyright © 2018 ANurita Srivastava. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var numberOfBubbles: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        // set up our view to present our game
        guard let view = self.view as? SKView else {return}
        
        // set up our game scene
        
        let gameScene = GameScene(size: self.view.frame.size)
        gameScene.scaleMode = .aspectFit
gameScene.numberOfBubbles = self.numberOfBubbles
        // present our game scene
        view.presentScene(gameScene)
       
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

