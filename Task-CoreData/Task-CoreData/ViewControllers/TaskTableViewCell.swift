//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by William Bateman on 7/27/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func toggleIsAccomplishedFor(task: Task)
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {

// MARK: Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!

// MARK: Properties
    var task: Task? {
        didSet {
            guard let task = task else { return }
            updateViews(task: task)
        }
    }
    
    weak var delegate: TaskCompletionDelegate?
    
// MARK: Actions

    @IBAction func completionButtonTapped(_ sender: Any) {
        guard let task = task else { return }
        delegate?.toggleIsAccomplishedFor(task: task)
    }
    
// MARK: Helper Methods
    func updateViews(task: Task?) {
        guard let task = task else { return }
        
        taskNameLabel.text = task.name
        
        if task.isComplete {
            completionButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        } else {
            completionButton.setImage(UIImage(systemName: "circle"), for: .normal)
        }
    }
    
} // End of Class

