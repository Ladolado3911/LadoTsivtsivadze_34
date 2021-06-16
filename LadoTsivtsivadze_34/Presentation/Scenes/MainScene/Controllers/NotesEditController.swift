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
    var note: Note?
    
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        clear()
    }
    
    func setTitle() {
        switch editingMode {
        case .newNote:
            title = "New Note"
        case .editNote:
            title = "Edit Note"
            setNoteIfNeeded()
        default:
            title = "No Note"
        }
    }
    
    func setNoteIfNeeded() {
        guard let note = note else { return }
        titleTextView.text = note.title
        noteTextView.text = note.text
    }
    
    func clear() {
        titleTextView.text = ""
        noteTextView.text = ""
    }

    @IBAction func onFinish(_ sender: UIButton) {
        let user = LocalManager.shared.loggedInUser
        switch editingMode {
        case .newNote:
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
        case .editNote:
            guard let note = note else { return }
            user!.removeFromNotes(note)
            if let newNote = LocalManager.shared.testMakeNote(title: titleTextView.text, text: noteTextView.text) {
                user!.addToNotes(newNote)
                print("edited")
            }
            else {
                print("could not edit")
            }
            
        default:
            break
        }
        popController(from: self, method: .withBackItem)
    }
}
