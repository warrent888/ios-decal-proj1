//
//  TasksViewController.swift
//  ToDoList
//
//  Created by Warren W Tian on 10/3/15.
//  Copyright © 2015 Warren Tian. All rights reserved.
//

import UIKit

class TasksViewController: UITableViewController{

    var tasks = [Task]()


    @IBOutlet var stats: UIButton!
    @IBOutlet var add: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl?.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(0, forKey: "tasksDone")
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath)
            var mySwitch: UISwitch
            mySwitch = UISwitch(frame: CGRectZero) as UISwitch
            mySwitch.addTarget(self, action:Selector("switchChanged:"), forControlEvents: UIControlEvents.ValueChanged)
            mySwitch.tag = indexPath.row
            let task = tasks[indexPath.row] as Task
            cell.textLabel?.text = task.task
            cell.detailTextLabel?.text = String(task.timestamp)
            cell.accessoryView = mySwitch
            
            return cell
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            tasks.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }

    @IBAction func switchChanged(sender: UISwitch) {
        let delay = 86400.0 //86400 - 24 hours
        //implement on off stats
        var count = 0
        let defaults = NSUserDefaults.standardUserDefaults()
        if let num = defaults.stringForKey("tasksDone")
        {
            count = Int(num)!
        }
        if sender.on {
            count = count + 1
        }
        if !sender.on {
            count = count - 1
        }
        defaults.setObject(count, forKey: "tasksDone")
        let timer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: "removeCell:", userInfo: sender.tag, repeats: false)
    }

    func getTasksDone() -> String {
//        for UISwitch s in switchCollection
        let defaults = NSUserDefaults.standardUserDefaults()
        if let count = defaults.stringForKey("tasksDone")
        {
            return count
        }
        return "error"
    }

    func removeCell(timer:NSTimer) {
        let rowNumber = timer.userInfo as? NSNumber
        tasks.removeAtIndex(Int(rowNumber!))
        tableView.reloadData()
        var count = 0
        let defaults = NSUserDefaults.standardUserDefaults()
        if let num = defaults.stringForKey("tasksDone")
        {
            count = Int(num)!
            count = count - 1
        }
        defaults.setObject(count, forKey: "tasksDone")

    }

    @IBAction func saveTask(segue:UIStoryboardSegue) {
        if let TaskAddViewController = segue.sourceViewController as? TaskAddViewController {

            //add the new task to the tasks array
            if let task = TaskAddViewController.task {
                tasks.append(task)
                //update the tableView
                let indexPath = NSIndexPath(forRow: tasks.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    @IBAction func cancelToMainViewController(segue:UIStoryboardSegue) {
    }

}
