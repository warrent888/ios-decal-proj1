//
//  TaskAddViewController.swift
//  ToDoList
//
//  Created by Warren W Tian on 10/3/15.
//  Copyright © 2015 Warren Tian. All rights reserved.
//

import UIKit

class TaskAddViewController: UIViewController {
    var task:Task?

    @IBOutlet var taskTextField: UITextField!

    @IBAction func cancelToMainViewController(segue:UIStoryboardSegue) {
    }

    @IBAction func saveTask(segue:UIStoryboardSegue) {
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveTask" {
            let date = Int(NSDate().timeIntervalSince1970)
            task = Task(task: taskTextField.text!, timestamp: date)
        }
    }
}
