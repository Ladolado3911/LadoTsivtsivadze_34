//
//  LoggedInPage.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import UIKit

class LoggedInController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func logOutButton(_ sender: UIButton) {
        LocalManager.shared.loggedInUser!.isLoggedIn = false
        popController(from: self, method: .withBackItem)
    }
}
