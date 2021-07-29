//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by William Bateman on 7/27/21.
//

import CoreData

extension Task {
    
    @discardableResult
    convenience init(name: String, notes: String? = nil, dueDate: Date? = nil, context: NSManagedObjectContext = coreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        
    }
} // End of Extension

