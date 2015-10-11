//
//  ViewController.swift
//  ToDoList
//
//  Created by Warren W Tian on 10/2/15.
//  Copyright © 2015 Warren Tian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tasks:[Task]!
    
    @IBOutlet var add: UIButton!
    @IBOutlet var stats: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelToMainViewController(segue:UIStoryboardSegue) {
    }
    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tasks.count
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
//        -> UITableViewCell {
//            let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath)
//            
//            let task = tasks[indexPath.row] as Task
//            cell.textLabel?.text = task.task
//            cell.detailTextLabel?.text = String(task.timestamp)
//            return cell
//    }
    
    @IBAction func saveTask(segue:UIStoryboardSegue) {
//        if let TaskAddViewController = segue.sourceViewController as? TaskAddViewController {
//            
//            //add the new player to the players array
//            if let task = TaskAddViewController.task {
//                tasks.append(task)
//                
//                //update the tableView
//                let indexPath = NSIndexPath(forRow: tasks.count-1, inSection: 0)
//                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//            }
//        }
    }

}

