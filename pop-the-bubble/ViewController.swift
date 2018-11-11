//
//  ViewController.swift
//  bubble-pop
//
//  Created by Anurita Srivastava on 10/11/18.
//  Copyright © 2018 ANurita Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var alert = Utils.self

    @IBOutlet weak var userInputTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openBubbleVC(_ sender: Any) {

        //check for valid input
        guard let input = Int(userInputTF.text ?? "0"), input > 4 else{
          alert.showAlert(title: "Invalid", message: "Enter more than 4", presenter: self)
            return
        }

        //store user input
        let store = UserDefaults.standard
        store.set(input, forKey: "Bubbles")

        //go to GameVC
        performSegue(withIdentifier: "segueToBubbleVC", sender: self)
    }

}
