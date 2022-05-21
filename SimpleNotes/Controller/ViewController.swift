//
//  ViewController.swift
//  SimpleNotes
//
//  Created by Denis Borneman on 17.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // reference to context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var notes : [NoteData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchData()

        tableView.register(UINib(nibName: "CustomViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        
    }
    
    func fetchData() {
        do {
            self.notes = try context.fetch(NoteData.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print("Error fetching data from NoteData \(error)")
        }
    }
    
   
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomViewCell
        guard let singleNote = self.notes?[indexPath.row] else {return cell}
        cell.labelTitle.text = singleNote.title
        return cell
    }
    
    
}
