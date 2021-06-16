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
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        pushController(from: self, to: registerController, method: .withBackItem)
    }
}
