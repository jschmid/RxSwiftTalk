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

        button.isEnabled = false
    }

    @IBAction func usernameChanged(_ sender: UITextField) {
        usernameErrorLabel.isHidden = isUsernameValid
        passwordTF.isEnabled = isUsernameValid
        
        checkButton()
    }
    
    @IBAction func passwordChanged(_ sender: UITextField) {
        passwordErrorLabel.isHidden = isPasswordValid
        
        checkButton()
    }
    
    var isUsernameValid: Bool {
        guard let value = usernameTF.text else {
            return false
        }
        
        let isValid = value.characters.count >= 5
        
        return isValid
    }
    
    var isPasswordValid: Bool {
        guard let value = passwordTF.text else {
            return false
        }
        
        let isValid = value.characters.count >= 5
        
        return isValid
    }
    
    func checkButton() {
        let areBothValid = isUsernameValid && isPasswordValid
        
        button.isEnabled = areBothValid
    }
}

