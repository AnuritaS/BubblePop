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
        guard let input = userInputTF.text else{
            print("ENTER")
            return
        }
        let d = UserDefaults.standard
        d.set(input, forKey: "Bubbles")
        performSegue(withIdentifier: "segueToBubbleVC", sender: self)
    }

}
