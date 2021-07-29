//
//  TaskListTableViewController.swift
//  Task-CoreData
//
//  Created by William Bateman on 7/27/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    
// MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskController.shared.fetchTasks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
// MARK: Properties
    var task: Task?

// MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }

        let task = TaskController.shared.tasks[indexPath.row]

        cell.task = task
        
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
              let destination = segue.destination as? TaskDetailViewController else { return }
        
        let task = TaskController.shared.tasks[indexPath.row]
        destination.task = task
    }
    
    
} // End of Class

extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(_ sender: TaskTableViewCell) {
        guard let task = task else { return }
        toggleIsAccomplishedFor(task: task)
        tableView.reloadData()
    }
    
    func toggleIsAccomplishedFor(task: Task) {
        TaskController.shared.toggleIsComplete(task: task)
        tableView.reloadData()
    }
    
    
} // End of Extension


