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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up our view to present our game
        guard let view = self.view as? SKView else {return}
        
        // set up our game scene
        let gameScene = Bubble(size: view.frame.size)
        gameScene.scaleMode = .aspectFit
        
        // present our game scene
        view.presentScene(gameScene)

    }

    @IBAction func goBack(_ sender: Any) {
       self.navigationController?.popViewController(animated: true)
    }
}

