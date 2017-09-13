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
        guard let passwordValue = passwordTF.text else {
            return false
        }
        
        guard let usernameValue = usernameTF.text else {
            return false
        }
        
        let longEnough = passwordValue.characters.count >= 5
        let notUsername = !passwordValue.contains(usernameValue)
        
        return longEnough && notUsername
    }
    
    func checkButton() {
        let areBothValid = isUsernameValid && isPasswordValid
        
        button.isEnabled = areBothValid
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let url = URL(string: "https://www.random.org/integers/?num=1&min=1000&max=9999&col=1&base=10&format=plain&rnd=new")
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    self.finalTV.text = "Error !"
                    self.finalTV.textColor = UIColor.red
                }
                return
            }
            guard let data = data else {
                return
            }

            let result = String(data: data, encoding: String.Encoding.utf8)
            
            DispatchQueue.main.async {
                self.finalTV.text = result
                self.finalTV.textColor = UIColor.green
            }
        }
        task.resume()
    }
}

