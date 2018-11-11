//
//  Utils.swift
//  pop-the-bubble
//
//  Created by Anurita Srivastava on 11/11/18.
//  Copyright © 2018 Danh Phu Nguyen. All rights reserved.
//

import Foundation
import UIKit

class Utils{
    static func showAlert(title: String, message: String, presenter: UIViewController){
        // create the alert
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        presenter.present(alert, animated: true, completion: nil)
    }
}
