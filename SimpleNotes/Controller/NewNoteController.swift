//
//  NewNoteController.swift
//  SimpleNotes
//
//  Created by Denis Borneman on 21.05.2022.
//

import UIKit

class NewNoteController: UIViewController {

    @IBOutlet weak var newNoteTitle: UITextField!
    @IBOutlet weak var noteTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        saveNote()

    }
    
    
    func saveNote() {
        let newNote = NoteData(context: Constants.context)
        newNote.title = newNoteTitle.text
        newNote.text = noteTextField.text
        do {
           try Constants.context.save()
        }
        catch {
            print("Error saving context data \(error)")
        }
    }
    
    
    
    

}


