//
//  EntryController.swift
//  Journal_CoreData
//
//  Created by Tasuku Yamamoto on 4/18/22.
//

import Foundation
import CoreData

class EntryController {
    //MARK: - Properties
    static let shared = EntryController()
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    //MARK: - Source of Truth
    var entries: [Entry] = []
    
    //MARK: - CRUD funcs
    func createEntry(title: String, body: String){
        let newEntry = Entry(title: title, bodytext: body)
        entries.append(newEntry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries(){
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.entries = entries
    }
  
    
    
}//End of class

