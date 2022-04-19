//
//  EntryDetailViewController.swift
//  Journal_CoreData
//
//  Created by Tasuku Yamamoto on 4/18/22.
//

import UIKit

class EntryDetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    //MARK: - Properties
    var entry: Entry?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - IBActions
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text,
              let body = bodyTextView.text,
              !title.isEmpty,
              !body.isEmpty else { return }
        if let entry = entry{
            EntryController.shared.updateEntry(entry: entry, newTitle: title, newBody: body)
        }else{
            EntryController.shared.createEntry(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Methods
    func updateViews(){
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodytext
    }
    
}//End of class
