//
//  ViewController.swift
//  RxSwiftTalk
//
//  Created by Jonas Schmid on 09.09.17.
//  Copyright © 2017 Liip AG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var finalTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        passwordTF.isEnabled = false
    }

    @IBAction func usernameChanged(_ sender: UITextField) {
        guard let value = usernameTF.text else {
            usernameErrorLabel.isHidden = false
            return
        }
        
        let isValid = value.characters.count >= 5
        
        usernameErrorLabel.isHidden = isValid
        passwordTF.isEnabled = isValid
    }
}

