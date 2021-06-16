//
//  LoggedInPage.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import UIKit

class LoggedInController: UIViewController {
    
    override func loadView() {
        super.loadView()
//        if let loggedInUser = LocalManager.shared.loggedInUser {
//            print("is logged in")
//
//        }
//        else {
//            print("not logged in")
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func logOutButton(_ sender: UIButton) {
        LocalManager.shared.loggedInUser!.isLoggedIn = false
        print(LocalManager.shared.users!)
        popController(from: self, method: .withBackItem)
    }
}
