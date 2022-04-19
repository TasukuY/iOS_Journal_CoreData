//
//  EntryListViewController.swift
//  Journal_CoreData
//
//  Created by Tasuku Yamamoto on 4/18/22.
//

import UIKit

class EntryListViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var entrylistTableView: UITableView!
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.shared.fetchEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        entrylistTableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "toEntryDetail" {
            guard let indexPath = entrylistTableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryDetailViewController else { return }
            let entryToSend = EntryController.shared.entries[indexPath.row]
            destination.entry = entryToSend
        }
    }
    
}//End of class

extension EntryListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell") as? EntryTableViewCell else { return UITableViewCell() }
        
        let entry = EntryController.shared.entries[indexPath.row]
        cell.configure(entry: entry)
        
        return cell
    }
}
