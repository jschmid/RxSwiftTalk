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
        
        let passwordLongEnough = passwordTF.rx.text.orEmpty
            .map { $0.characters.count >= 5 }
            .shareReplay(1)
        
        let passwordDoesNotContainUsername = Observable.combineLatest(usernameTF.rx.text.orEmpty, passwordTF.rx.text.orEmpty)
            .map { (username, password) -> Bool in !password.contains(username) }
            .shareReplay(1)
        
        let passwordValid = Observable.combineLatest(passwordLongEnough, passwordDoesNotContainUsername) { $0 && $1 }
            .shareReplay(1)
        
        let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
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
        
        everythingValid
            .bind(to: button.rx.isEnabled)
            .disposed(by: disposeBag)
        
        button.rx.tap
            .flatMapLatest { _ -> Observable<Data> in
                let url = URL(string: "https://www.random.org/integers/?num=1&min=1000&max=9999&col=1&base=10&format=plain&rnd=new")
                let request = URLRequest(url: url!)
                
                return URLSession.shared.rx.data(request: request)
            }
            .map { data in String(data: data, encoding: String.Encoding.utf8) }
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { result in
                self.finalTV.text = result
                self.finalTV.textColor = UIColor.green
            }, onError: { _ in
                self.finalTV.text = "Error !"
                self.finalTV.textColor = UIColor.red
            })
            .disposed(by: disposeBag)
    }

}

