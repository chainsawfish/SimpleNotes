//
//  NewNoteController.swift
//  SimpleNotes
//
//  Created by Denis Borneman on 21.05.2022.
//

import UIKit

class NewNoteController: UIViewController {
    
    var tempTitle = ""
    var tempText = ""
    @IBOutlet weak var newNoteTitle: UITextField!
    @IBOutlet weak var noteTextField: UITextView!
    @IBOutlet weak var buttonSave: UIButton!{
        didSet{
            buttonSave.layer.shadowOffset = CGSize(width: 0, height: 4)
            buttonSave.layer.shadowRadius = 5
            buttonSave.layer.shadowOpacity = 0.5
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        saveNote()

    }
    
    // TODO: need to fix saving duplicates
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
    
    
    // MARK: forming existing note after clicking at cell
    override func viewWillAppear(_ animated: Bool) {
        newNoteTitle.text = tempTitle
        noteTextField.text = tempText
    }
    
    

}


