//
//  NotesEditController.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import UIKit

class NotesEditController: UIViewController {
    
    var editingMode: EditingMode?
    var controllerPointer: NotesListController?
    
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle()
    }
    
    func setTitle() {
        switch editingMode {
        case .newNote:
            title = "New Note"
        case .editNote:
            title = "Edit Note"
        default:
            title = "No Note"
        }
    }
    
    @IBAction func onFinish(_ sender: UIButton) {
        
        //LocalManager.shared.createNoteObject(title: titleTextView.text, text: noteTextView.text)
        
        let user = LocalManager.shared.loggedInUser
        
        
//        print(user?.username)
//        print(note?.title)
        if let note = LocalManager.shared.testMakeNote(title: titleTextView.text, text: noteTextView.text) {
            user!.addToNotes(note)
            print("added")
        }
        else {
            print("could not add")
        }
        
        let testData = LocalManager.shared.getUserNotes(user: user!)!.map { $0.title }
        print(testData)
        //print(LocalManager.shared.notes!.map { $0.title })

    
        
        //popController(from: self, method: .withBackItem)
    }
}
