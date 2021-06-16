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
        
        LocalManager.shared.createNoteObject(title: titleTextView.text, text: noteTextView.text)
        
        let user = LocalManager.shared.loggedInUser
        let note = LocalManager.shared.getNote(byTitle: titleTextView.text)
        
        print(user?.username)
        print(note?.title)
        
        user!.notes = NSSet(object: note)
        
        //print(LocalManager.shared.notes!.map { $0.title })
        print(LocalManager.shared.getUserNotes(user: user!)!)
    
        
        //popController(from: self, method: .withBackItem)
    }
}
