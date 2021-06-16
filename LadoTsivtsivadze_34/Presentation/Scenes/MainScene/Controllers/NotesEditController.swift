//
//  NotesEditController.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import UIKit

class NotesEditController: UIViewController {
    
    var editingMode: EditingMode?
    
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
}
