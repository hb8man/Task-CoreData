//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by William Bateman on 7/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

// MARK: Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatepicker: UIDatePicker!
    
    
// MARK: Properties
    var task: Task?
    var date: Date?
    
// MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
// MARK: Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
    
        guard let title = taskNameTextField.text, !title.isEmpty else { return }
        
        if let task = task {
            TaskController.shared.update(task: task, name: taskNameTextField.text!, notes: taskNotesTextView.text, dueDate: taskDueDatepicker.date)
        } else {
            TaskController.shared.createTaskWith(name: taskNameTextField.text!, notes: taskNotesTextView.text, dueDate: taskDueDatepicker.date)
        }
        navigationController?.popViewController(animated: true)
    }
        
    @IBAction func dueDatePickerChanged(_ sender: Any) {
        task?.dueDate = taskDueDatepicker.date
    }
    
// MARK: Helper Functions
    func updateViews() {
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatepicker.date = task.dueDate!
    }
    
} // End of Class

