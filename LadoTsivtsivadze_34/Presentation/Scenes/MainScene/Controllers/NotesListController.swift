//
//  ViewController.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import UIKit
import CoreData

class NotesListController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    lazy var notesEditController: NotesEditController = {
        let vc = getController(storyboardID: .main, controllerID: .notesEdit) as? NotesEditController
        return vc!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        
        print(LocalManager.shared.users)
    }


    func configTableView() {
        tblView.dataSource = self
        tblView.delegate = self
    }
    
    func save() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        guard let description = NSEntityDescription.entity(forEntityName: "User", in: context) else { return }
        let obj = NSManagedObject(entity: description, insertInto: context)
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


