//
//  ViewController.swift
//  bubble-pop
//
//  Created by Anurita Srivastava on 10/11/18.
//  Copyright © 2018 ANurita Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInputTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openBubbleVC(_ sender: Any) {

        performSegue(withIdentifier: "segueToBubbleVC", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "segueToBubbleVC" {
     let controller = segue.destination as! GameViewController
            guard let input = userInputTF.text else{
                print("ENTER")
                return
            }
            controller.numberOfBubbles = Int(input)
         }

    }

}
