//
//  ENtry+Convenience.swift
//  Journal_CoreData
//
//  Created by Tasuku Yamamoto on 4/18/22.
//

import Foundation
import CoreData

extension Entry {
    @discardableResult convenience init(title: String, bodytext: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.title = title
        self.bodytext = bodytext
        self.timestamp = timestamp
    }
}//End of extension
