//
//  ViewController.swift
//  RxSwiftTalk
//
//  Created by Jonas Schmid on 09.09.17.
//  Copyright © 2017 Liip AG. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var finalTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usernameValid = usernameTF.rx.text.orEmpty
            .map { $0.characters.count >= 5 }
            .shareReplay(1)
        
        let passwordValid = passwordTF.rx.text.orEmpty
            .map { $0.characters.count >= 5 }
            .shareReplay(1)
        
        usernameValid
            .bind(to: usernameErrorLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        usernameValid
            .bind(to: passwordTF.rx.isEnabled)
            .disposed(by: disposeBag)
        
        passwordValid
            .bind(to: passwordErrorLabel.rx.isHidden)
            .disposed(by: disposeBag)
    }

}

