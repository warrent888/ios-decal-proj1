//
//  ShowStatsViewController.swift
//  ToDoList
//
//  Created by Warren W Tian on 10/3/15.
//  Copyright © 2015 Warren Tian. All rights reserved.
//

import UIKit

class ShowStatsViewController: UIViewController {
    
    @IBOutlet var numTasksDone: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        getTasksDone()
    }

    func getTasksDone() {
        let task = TasksViewController().getTasksDone()
        numTasksDone.text = task
    }

    @IBAction func cancelToMainViewController(segue:UIStoryboardSegue) {
    }
}
