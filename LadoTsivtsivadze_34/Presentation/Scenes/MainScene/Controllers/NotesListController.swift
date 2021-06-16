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
    @IBOutlet weak var newNoteButton: UIBarButtonItem!
    
    lazy var data: [Note]? = {
        let loggedInUser = LocalManager.shared.loggedInUser
        let userNotes = loggedInUser?.relationship?.allObjects as? [Note]
        return userNotes
    }()
    
    lazy var notesEditController: NotesEditController = {
        let vc = getController(storyboardID: .main, controllerID: .notesEdit) as? NotesEditController
        return vc!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let loggedInUser = LocalManager.shared.loggedInUser {
            tblView.isHidden = false
            newNoteButton.isEnabled = true
        }
        else {
            tblView.isHidden = true
            newNoteButton.isEnabled = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //print(LocalManager.shared.users)
    }


    func configTableView() {
        tblView.dataSource = self
        tblView.delegate = self
        
        let nib = UINib(nibName: "noteCell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "noteCell")
    }

    @IBAction func newNote(_ sender: UIBarButtonItem) {
        let vc = notesEditController
        vc.editingMode = .newNote
        pushController(from: self, to: vc, method: .withBackItem)
    }
}

extension NotesListController: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = data {
            return data.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as? noteCell
        guard let data = data else { return noteCell() }
        
        cell!.title = data[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = notesEditController
        vc.editingMode = .editNote
        pushController(from: self, to: vc, method: .withBackItem)
    }
}


