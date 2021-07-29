//
//  TaskController.swift
//  Task-CoreData
//
//  Created by William Bateman on 7/27/21.
//

import CoreData

class TaskController {

// MARK: Properties
    static var shared = TaskController()
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()

// MARK: CRUD Functions
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(name: name, notes: notes!, dueDate: dueDate!, context: coreDataStack.context)
        tasks.append(newTask)
        
        coreDataStack.saveContext()
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
    
        coreDataStack.saveContext()
    }
    
    func fetchTasks() {
        let tasksToFetch = ( try?
            coreDataStack.context.fetch(fetchRequest)) ?? []
        self.tasks = tasksToFetch
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        
        coreDataStack.saveContext()
    }
    
} // End of Class



