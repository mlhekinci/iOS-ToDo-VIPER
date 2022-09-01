//
//  Task.swift
//  iOS-ToDo-App
//
//  Created by Melih on 30.08.2022.
//

import Foundation

class Task {
    var task_id: Int?
    var task_title: String?
    
    init(task_id: Int, task_title: String) {
        self.task_id = task_id
        self.task_title = task_title
    }
}
