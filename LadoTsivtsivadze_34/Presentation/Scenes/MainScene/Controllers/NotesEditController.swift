//
//  NotesEditController.swift
//  LadoTsivtsivadze_34
//
//  Created by lado tsivtsivadze on 6/16/21.
//

import UIKit

class NotesEditController: UIViewController {
    
    var editingMode: EditingMode?

    override func viewDidLoad() {
        super.viewDidLoad()
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
