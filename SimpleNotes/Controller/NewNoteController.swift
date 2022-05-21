//
//  NewNoteController.swift
//  SimpleNotes
//
//  Created by Denis Borneman on 21.05.2022.
//

import UIKit

class NewNoteController: UIViewController {

    @IBOutlet weak var newNoteTitle: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func saveNote() {
        let newNote = NoteData(context: Constants.context)
        newNote.title = newNoteTitle.text
        newNote.text = textView.text
        do {
           try Constants.context.save()
            guard let firstVC = presentingViewController as? ViewController else {return}
            DispatchQueue.main.async {
                firstVC.fetchData()
            }
        }
        catch {
            print("Error saving context data \(error)")
        }
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        saveNote()
    }
    

}