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
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func registerButton(_ sender: UIButton) {
//        LocalManager.shared.createUserObject(username: userNameField.text!, password: passwordField.text!)
//        print(LocalManager.shared.getUser(byUsername: "123"))
//        print(LocalManager.shared.getUser(byUsername: "also"))
//        print(LocalManager.shared.getUser(byUsername: "unknown"))
        LocalManager.shared.users!.map { print($0.username) }
    }
}
