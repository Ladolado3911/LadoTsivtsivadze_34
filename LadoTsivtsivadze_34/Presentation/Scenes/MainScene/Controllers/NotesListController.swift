//
//  ViewController.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import UIKit

class NotesListController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    lazy var notesEditController: NotesEditController = {
        let vc = getController(storyboardID: .main, controllerID: .notesEdit) as? NotesEditController
        return vc!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }


    func configTableView() {
        tblView.dataSource = self
        tblView.delegate = self
    }
    
    @IBAction func newNote(_ sender: UIBarButtonItem) {
        let vc = notesEditController
        vc.editingMode = .newNote
        pushController(from: self, to: vc, method: .withBackItem)
    }
}

extension NotesListController: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}


