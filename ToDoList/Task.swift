//
//  Task.swift
//  ToDoList
//
//  Created by Warren W Tian on 10/3/15.
//  Copyright © 2015 Warren Tian. All rights reserved.
//

import UIKit

struct Task {
    var task: String?
    var timestamp: Int?
    
    init(task: String?, timestamp: Int?) {
        self.task = task
        self.timestamp = timestamp
    }
}