//
//  RegisterController.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
//
//  private var logInController: LogInController = {
//        let vc = getController(storyboardID: .main, controllerID: .logIn) as? LogInController
//        return vc!
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        if userNameField.text == "" || passwordField.text == "" {
            return
        }
        
        LocalManager.shared.createUserObject(username: userNameField.text!, password: passwordField.text!)
        popController(from: self, method: .withBackItem)
//        print(LocalManager.shared.getUser(byUsername: "123"))
//        print(LocalManager.shared.getUser(byUsername: "also"))
//        print(LocalManager.shared.getUser(byUsername: "unknown"))
    }
}
