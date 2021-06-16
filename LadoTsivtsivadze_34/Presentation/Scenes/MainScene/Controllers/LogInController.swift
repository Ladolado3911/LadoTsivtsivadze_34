//
//  LogInController.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import UIKit

class LogInController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    private var registerController: RegisterController = {
        let vc = getController(storyboardID: .main, controllerID: .register) as? RegisterController
        return vc!
    }()
    
    private var loggedInController: LoggedInController = {
        let vc = getController(storyboardID: .main, controllerID: .loggedIn) as? LoggedInController
        return vc!
    }()
    
    override func loadView() {
        super.loadView()
        if let loggedInUser = LocalManager.shared.loggedInUser {
            print("go to profile page or show something")
            pushController(from: self, to: loggedInController, method: .withoutBackItem)
        }
        else {
            print("else block")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        if userNameField.text == "" || passwordField.text == "" {
            return
        }
        LocalManager.shared.logInUser(inputUsername: userNameField.text!, inputPassword: passwordField.text!) {
            pushController(from: self, to: self.loggedInController, method: .withoutBackItem)
        }
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        pushController(from: self, to: registerController, method: .withBackItem)
    }
}
